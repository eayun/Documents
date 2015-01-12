# 连接到OVIRTMANAGER

*Api*
类充当了一个关口用来连接OVIRTMANAGER和操作OVIRTMANAGER的资源。每当你的工程需要与管理端互动时，你必须定义一个该类的实例。

要定义一个该类的实例，首先需要将 *Api* 类 import 到你的工程。

    import org.ovirt.engine.sdk.Api;
        

接下来，声明一个该类的实例如下：

    Api api = new Api("[你的管理端的地址]", "[用户名]@[域]", 
    "[密码]", "[证书路径]");
        

在上面代码中，管理端的地址指的是连接到OVIRTMANAGER的地址和端口名称，用户名，域和密码是登陆需要的内容，证书的路径是保存在你本地的用于与管理端建立
SSL 连接所需的证书文件。要了解使用证书文件的更多信息，参见 ?。

如下的示例更详细地描述了该过程：

            
    import org.ovirt.engine.sdk.Api;
    import java.io.IOException;
    public class Main
    {
     private static final String URL = "https://localhost:443/api";
     
     @SuppressWarnings("unused");
     public static void main(String[] args) throws ClientProtocolException,
     ServerException, UnsecuredConnectionAttemptError, IOException
     {
     // #1 Authenticate using the user name and password
     Api api = new Api(URL, "admin@interal", "123456", "/home/user/.ovirtsdk/");
     
     ...
     }
    }

          

