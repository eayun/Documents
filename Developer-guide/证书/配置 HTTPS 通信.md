# 配置 HTTPS 通信

*概述*.  
在您的系统上配置 HTTPS 使用 SSL 证书密钥。

编辑 `/etc/httpd/conf.d/ssl.conf` 文件并修改如下设置：

    SSLCertificateFile 
    SSLCertificateKeyFile 
            

修改这些设置之后重启您的 web 服务器：

    # service httpd restart
            

*结论*.  
您在您的系统上完成了对 HTTPS 使用 SSL 证书密钥的配置。

