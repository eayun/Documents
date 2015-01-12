# 创建 SSL/TLS 证书

*概述*.  
SSL/TLS 为使用 HTTPS 访问您的 OVIRT
提供了安全层。以下过程介绍了如何创建证书并使用该证书配置您的主机。

以下过程需要使用 `openssl`。在您的主机上运行如下命令安装该工具：

    # yum install openssl
        

证书认证机构 (CA)
通过对证书进行签名来提供对证书有效性的验证。网络浏览器包含了一些用以对与安全网络站点间的
HTTPS 通信进行验证的 CA 证书。这些 CA
证书中有一些是收费的，也有些是开放的且免费提供的。本过程描述了如何生成您自己的证书认证机构
(CA) 证书和密钥，以供您的内部网络使用。

运行如下命令：

    # openssl req -new -x509 -keyout ca.key -out ca.crt -days 3650
            

此命令请求生成一个有效期为 3650 天的 CA 证书对。

输入密码以保护您的 CA：

    Generating a 2048 bit RSA private key
    ......................................................................................................................................+++..................................................................................................+++
    writing new private key to 'ca.key'
    Enter PEM pass phrase:
    Verifying - Enter PEM pass phrase:
            

输入关于您的组织的信息：

    Country Name (2 letter code) [XX]:CN
    State or Province Name (full name) []:Beijing
    Locality Name (eg, city) [Default City]:Beijing
    Organization Name (eg, company) [Default Company Ltd]:Eayun
    Organizational Unit Name (eg, section) []:EayunOS
    Common Name (eg, your name or your server's hostname) []:www.example.com
    Email Address []:admin@eayun.com
            

以上信息将会形成您的证书中的唯一名称 (DN)。

*结论*.  
您创建了一个证书认证机构。`openssl`
创建了两个文件：管理员用以对证书进行签名的密钥文件 `ca.key`
和用户能够获取到的用以验证他们接收到的已签名证书有效性的公共 CA 证书
`ca.crt`。确保访问您的主机的用户都得到一份 `ca.crt`
的副本，这样子他们就可以将该证书导入到他们客户端中信任的 CA 存储中。

