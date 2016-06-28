# 安装和配置一个 Squid 代理

**介绍**

以下介绍了如何为用户门户安装和配置一个 Squid 代理。Squid 代理服务器起到了一个内容加速的作用，它可以缓存经常被访问的内容，减少对带宽的消耗，并可以减少响应时间。

**配置一个 Squid 代理**

- 为 Squid 代理服务器的 HTTPS 端口获得一个密钥对和一个证书。获得这个密钥对的方法和获得其它 SSL/TLS 服务密钥对的方法完全相同。这个密钥对以两个 PEM 文件的形式出现，包括了私人密钥和一个签字的证书。我们在这里假设它们的名字是 proxy.key 和 proxy.cer。

>- **注意**

>- 密钥对和证书也可以通过引擎的证书认证机构产生。如果您的代理已经有了私人密钥和证书，而且不想使用引擎的证书认证机构重新产生它们，请跳过下一步。

- 为代理选择一个主机名。然后，选择代理证书的其它项。

>- **注意**

>- 通常情况下，应该使用和引擎相同的国家名（C）和机构名（O）。要获得这些信息，请登录到 Manager 所在的机器，并运行以下命令：

>- ```# openssl x509 -in /etc/pki/ovirt-engine/ca.pem -noout -subject```

>- 这个命令会输出和以下相似的内容：

>- subject= /C=US/O=Example Inc./CN=engine.example.com.81108

>- 这里相关的部分是 /C=US/O=Example Inc.。使用它来为代理的证书创建一个唯一的证书名：

>- /C=US/O=Example Inc./CN=proxy.example.com

- 登录到代理所在的机器，并生成一个证书签署请求：

```
	# openssl req -newkey rsa:2048 -subj '/C=US/O=Example Inc./CN=proxy.example.com' -nodes -keyout proxy.key -out proxy.req
```

>- **重要**

>- 证书名外的引号非常重要，一定不能省掉它们。 -nodes 选项确保了私人密钥没有被加密，您在启动代理时将不需要输入密码。

	这个命令会产生两个文件：proxy.key 和 proxy.req。proxy.key 是私人密钥，您需要把它保存在一个安全的地方。proxy.req 是证书签署请求，proxy.req 并不需要特殊的保护。

- 要产生签署的证书，使用以下命令把证书签署请求文件从代理所在的机器上复制到安装 Manager 的机器上：

```
	# scp proxy.req engine.example.com:/etc/pki/ovirt-engine/requests/.
```

- 登录到 Manager 所在的机器上签署证书：

```
	# /usr/share/ovirt-engine/bin/pki-enroll-request.sh --name=proxy --days=3650 --subject='/C=US/O=Example Inc./CN=proxy.example.com'
```

它将为证书进行签署，使它在 10 年（3650 天）内有效。您可以根据需要，为证书设置相应的有效期。

- 所产生的证书文件保存在 /etc/pki/ovirt-engine/certs 目录中，它的名字应该是 proxy.cer。把这个文件从 Manager 所在机器复制到代理所在机器的当前目录中：

```
	# scp engine.example.com:/etc/pki/ovirt-engine/certs/proxy.cer .
```

- 确认代理机器包括了 proxy.key 和 proxy.cer 文件：

```
	# ls -l proxy.key proxy.cer
```

- 在代理机器上安装 Squid 代理服务器软件包：

```
	# yum install squid
```

- 把私人密钥和签署的证书发到代理可以访问的地方，如 /etc/squid 目录：

```
	# cp proxy.key proxy.cer /etc/squid/.
```

- 设置权限，从而使 squid 用户可以读这些文件：

```
	# chgrp squid /etc/squid/proxy.*
	# chmod 640 /etc/squid/proxy.*
```

- Squid 代理需要验证引擎所使用的证书。把 Manager 的证书复制到代理所在的机器上。这个实例使用的文件路径是 /etc/squid：

```
	# scp engine.example.com:/etc/pki/ovirt-engine/ca.pem /etc/squid/.
```

>- **注意**

>- 默认的 CA 证书位于 Manager 所在机器的 /etc/pki/ovirt-engine/ca.pem。

- 设置权限，从而使 squid 用户可以读证书文件：

```
	# chgrp squid /etc/squid/ca.pem
	# chmod 640 /etc/squid/ca.pem
```

- 如果 SELinux 处于 enforcing 模式，使用 semanage 修改端口 443 的内容，从而使 Squid 可以使用端口 443。

```
	# yum install policycoreutils-python
	# semanage port -m -p tcp -t http_cache_port_t 443
```

- 使用以下的内容替换存在的 Squid 配置文件：

```
	https_port 443 key=/etc/squid/proxy.key
	cert=/etc/squid/proxy.cer ssl-bump
	defaultsite=engine.example.com
	cache_peer engine.example.com parent 443 0 no-query
	originserver ssl sslcafile=/etc/squid/ca.pem
	name=engine
	cache_peer_access engine allow all
	ssl_bump allow all
	http_access allow all
```

- 重启 Squid 代理服务器

```
	# service squid restart
```

- 使用完整 URL 连接到用户门户，例如：

```
https://proxy.example.com/UserPortal/org.ovirt.engine.ui.userportal.UserPortal/UserPortal.html
```

>- **注意**

>- 短的 URL（如[https://proxy.example.com/UserPortal]）将无法正常工作。应用服务器会试图使用 302 response code 和 Location header 把这些短的 URL 重新定向到正确的 URL，但是 EayunOS 中所提供的 Squid 版本（Squid version 3.1）不支持这个功能。

>- 默认情况下，Squid 代理会在空闲连接时间超过 15 分钟后终止这个空闲连接。要增加这个时间，调整 squid.conf 中的 read_timeout 选项（如把它设为 read_timeout 10 hours）。

```
    # ssh root@[IP of Manager]
```

- 运行以下命令来删除 SPICE 代理：

```
	# engine-config -s SpiceProxyDefault=""
```

- 重新启动 EayunOS Manager：

```
	# service ovirt-engine restart
```
	
SPICE 代理被关闭，用户将无法通过 SPICE 代理对 Red Hat Enterprise Virtualization 网络进行访问。
