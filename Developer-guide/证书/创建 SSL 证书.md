# 创建 SSL 证书

*概述*.  
以下过程创建了一个 SSL 证书并使用 CA 密钥对其进行签名。SSL/TLS
证书为使用 HTTPS 访问您的 OVIRT
提供了安全层。以下过程介绍了如何创建证书并使用该证书配置您的主机。

以下过程需要使用 `openssl`。在您的主机上运行如下命令安装该工具：

    # yum install openssl
        

为您的主机创建一个密钥：

    # openssl genrsa -out ssl.key
            

这将创建一个 `ssl.key` 密钥文件。

使用该密钥文件为您的证书创建一个签名请求：

    # openssl req -new -key ssl.key -out ssl.csr
            

签名请求将会询问一些组织的信息以便形成您的证书中的唯一名称 (DN)。

    Country Name (2 letter code) [XX]:CN
    State or Province Name (full name) []:Beijing
    Locality Name (eg, city) [Default City]:Beijing
    Organization Name (eg, company) [Default Company Ltd]:Eayun
    Organizational Unit Name (eg, section) []:EayunOS
    Common Name (eg, your name or your server's hostname) []:www.example.com
    Email Address []:admin@eayun.com
            

这将创建一个 `ssl.csr` 签名请求文件。

创建一个已签名的 SSL 证书：

    # openssl ca -cert ca.crt -keyfile ca.key -out ssl.crt -infiles ssl.csr
            

`openssl` 将询问你的 CA 密钥的密码。

这将创建一个名为 `ssl.crt` 的证书文件。

> **Important**
>
> 以上的命令可能会出现如下错误：
>
>     Using configuration from /etc/pki/tls/openssl.cnf
>     Enter pass phrase for ca.key:
>     /etc/pki/CA/index.txt: No such file or directory
>     unable to open '/etc/pki/CA/index.txt'
>     139883256969032:error:02001002:system library:fopen:No such file or
>     directory:bss_file.c:355:fopen('/etc/pki/CA/index.txt','r')
>     139883256969032:error:20074002:BIO routines:FILE_CTRL:system
>     lib:bss_file.c:357:
>               
>
> 创建 index.txt 文件。
>
>     # touch /etc/pki/CA/index.txt
>                   
>
> 创建一个序列文件以标识 CA 和随后的证书。
>
>     # echo '1000' > /etc/pki/CA/serial
>                   
>
> 您只需要在第一次生成 SSL 证书的时候进行此工作。现在可以重新运行命令：
>
>     # openssl ca -cert ca.crt -keyfile ca.key -out ssl.crt -infiles ssl.csr
>               

`ssl.crt` 和 `ssl.key` 将组成您的主机用以加密解密 HTTPS 数据的证书对。

*结论*.  
您创建了 SSL 证书并使用 CA 密钥对其进行签名。`openssl`
创建了两个文件：管理员用以对证书进行签名的密钥文件 `ca.key`
和用户能够获取到的用以验证他们接收到的已签名证书有效性的公共 CA 证书
`ca.crt`。确保访问您的主机的用户都得到一份 `ca.crt`
的副本，这样子他们就可以将该证书导入到他们客户端中信任的 CA 存储中。

