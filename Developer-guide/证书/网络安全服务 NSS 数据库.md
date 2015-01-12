# 网络安全服务 (NSS) 数据库

网络安全服务 (NSS) 是一套支持 SSL 的开源的密码系统库。一些 Linux
工具，比如 `cURL`，使用 NSS 来验证可信的 SSL 通信。此过程帮助用户导入
`EayunOS.cer` 证书进入本地的 NSS 数据库中。

对于单个用户，使用如下命令导入 `EayunOS.cer` 证书：

    $ certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "EayunOS Manager" -i EayunOS.cer
        

对于系统上的所有用户，使用 *root* 账户登录并运行如下命令导入
`EayunOS.cer` 证书：

    # certutil -d sql:/etc/pki/nssdb -A -t TC -n "EayunOS Manager" -i EayunOS.cer
        

