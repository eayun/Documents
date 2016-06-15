# SPICE 代理系统的设置

以下介绍了如何把一台机器设置为 SPICE 代理。SPICE 代理可以实现从远程网络访问 Red Hat Enterprise Virtualization 网络的功能。我们使用 Squid 来提供代理服务。

这个过程假设您已经配置了一个或多个外部 SNMP 管理器来接收 trap，并且有以下信息：

**在 EayunOS Linux 上安装 Squid。**

1. 在代理机器上安装 Squid：

```
    # yum install squid
```
	
2. 打开 /etc/squid/squid.conf，把以下内容：

```
	http_access deny CONNECT !SSL_ports
```

   改为：

```
	http_access deny CONNECT !Safe_ports
```
   
3. 启动代理：

```
	# service squid start
```
	
4. 打开默认的 squid 端口：.

```
	# iptables -A INPUT -p tcp --dport 3128 -j ACCEPT
```
	
5. 保存这个 iptables 的规则：

```
	# service iptables save
```
	
您把一台机器设置为了 SPICE 代理。在从远程网络访问 EayunOS Virtualization 网络时，请先激活这个 SPICE 代理。