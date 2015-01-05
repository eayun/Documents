# TLS/SSL 认证

OVIRTMANAGER的API需要超文本传输安全协议（HTTPS）[1]来和客户端建立安全的连接，例如管理端的
SDK 和 CLI
组件。这就需要获得OVIRTMANAGER的安全证书并将之导入到客户端程序的证书列表中。

> **Important**
>
> 请使用安全的连接来获得OVIRTMANAGER的证书。

你可以使用如下三种方法来获得OVIRTMANAGER的证书并传输到客户端机器上：

*方法1* - 使用命令行工具从管理端下载证书。命令行工具的示例有 cURL 和
Wget。它们都可以在多平台下使用。

-   如果使用的是 cURL：

        $ curl -o EayunOS.cer http://[EayunOS-server]/ca.crt

-   如果使用的是 Wget：

        $ wget -O EayunOS.cer http://[EayunOS-server]/ca.crt

*方法2* - 使用浏览器访问如下连接：

    http://[EayunOS-server]/ca.crt

根据浏览器的不同，浏览器要么会下载证书文件，要么会将证书导入浏览器的证书列表中。

-   如果浏览器下载了证书文件，将证书文件保存为*EayunOS.cer*文件。

-   如果浏览器导入了证书文件，将证书从浏览器的证书设置里导出并保存为*EayunOS.cer*文件。

*方法3* - 登陆管理端，将证书从信任库中导出并复制到你的客户端机器中去。

-   以 root 用户 ssh 连接到管理端。

-   使用 Java 的 *keytool* 命令将信任库中的证书导出：

        $ keytool -exportcert -keystore /etc/pki/ovirt-engine/.truststore -alias cacert -storepass mypass -file EayunOS.cer

    这将创建一个名为 *EayunOS.cer* 的文件。

-   使用 *scp* 命令将上布的证书文件复制到客户端机器中去。

        $ scp rhevm.cer [username]@[client-machine]:[directory]

以上的三个方法都会在你的客户端机器上产生一个名为 *EayunOS.cer*
的文件。一个 API 用户将会把该文件导入到客户端的证书信用库中去。

将证书文件导入到客户端的证书信用库中的动作取决于客户端是怎么保存和操作证书的。本向导包含一些导入证书的示例。对于没有使用网络安全服务（NSS）或者
Java
密钥库（JKS）的客户端，请参见你们自己的文档来获得更多关于导入证书的信息。

