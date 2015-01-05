# Java Keystore

此过程示范了如何导入一个从 OVIRT MANAGER 服务器上导出的 X.509
证书至一个新建的 Java keystore 文件中。

此过程帮助用户导入 `EayunOS.cer` 证书至 Java keystore
中。过程中需要用到来自 Java 开发工具套件 (JDK) 中的 `keytool`
管理工具，在 Linux 和 Windows 系统中都可以得到并使用。

进入您的客户端机器并确认 `EayunOS.cer` 证书位置。

使用 Java `keytool` 管理工具导入 `EayunOS.cer` 证书：

    keytool -importcert -v -trustcacerts -keystore restapi.jks -noprompt -alias EayunOS -file EayunOS.cer
            

`keytool` 工具将新建一个名为 `restapi.jks` 的 keystore 文件。

`keytool` 将询问 keystore 文件的密码。输入该密码然后 `keytool`
会请求再次输入确认。

`keytool` 添加 `EayunOS.cer` 证书至 `restapi.jks` keystore 文件中。使用
`keytool -list` 命令查看 keystore 文件中的证书项目：

    keytool -list -keystore restapi.jks -storepass [password]
            

> **Important**
>
> 有些版本的 `keytool` 不能够正确的解析证书。如果 `keytool`
> 不能够解析出该证书的格式，使用 `openssl` 工具将其转换为另一个 X.509
> 格式的证书：
>
>     openssl x509 -in EayunOS.cer -out EayunOS.new -outform [pem|der]
>           
>
> 这将创建一个文件名为 `EayunOS.new` 的证书，可以替代 `EayunOS.cer`
> 使用。

