# 使用python连接到应用程序接口

使用ovirtsdk.api模块，创建类API的实例，python才能连接到REST
API，所以在脚本的开始部分，写如下导入语句是必须的：

                     from ovirtsdk.api import API
                    

类API的构造函数可接受很多参数，目前支持的参数有如下内容：

*url*.  
指定OVIRT管理端的URL以连接到它，包含路径/api。此参数是强制性的，必须给定。

*username*.  
指定连接时使用的用户名，使用UPN格式。此参数是强制性的，必须给定。

*password*.  
指定连接时使用的用户的密码。此参数是强制性的，必须给定。

*key\_file*.  
指定PEM格式的密钥文件，其包含和cert\_file所指定的认证所关联的私钥。此参数为可选参数。

*cert\_file*.  
指定PEM格式的客户端证书，此证书用于客户端连接到服务器时建立身份关系。此参数为可选参数。

*ca\_file*.  
指定从服务端取得授权证书的证书文件。
除非insecure设置为true,否则，此选项为强制性的。

*port*.  
若没有在url中指定特定的端口，可使用此参数指定。此参数为可选参数。

*timeout*.  
指定超时时间，单位为秒。此参数为可选参数。

*persistent\_auth*.  
指定当次连接为持久，参数为True或False,此参数为可选参数，且默认为False。

*insecure*.  
允许通过ssl连接而无需获得证书的授权，参数为True或False,如果将insecure设置为Fasle(也是系统默认的)，ca\_file必须提供。
请谨慎使用此参数，这容易被使用man-in-the-middle (MIT M)攻击。

*filter*.  
指定基于用户权限的过滤器是否起作用，合法的参数为True或false.若Filter设置为false,也是系统默认的，则加入此必须为管理员。
若设置为True,则任何用户都可以使用，但且其可运行的动作等是基于用户权限，也就是由管理端自动过滤掉不属于他的权限。
此参数为可选参数。

*debug*.  
指定建立的连接是否打开调试模式，参数为True或Fasle,为可选参数。

开发者可以建立和操作多个ovirtsdk.API的python类的实例去和多个OVIRT管理端的RESTful
API通信。

下面的这个实例脚本，建立了一个API类的实例，使用test()方法检测连接是否正常，使用disconnect()断开连接：

         from ovirtsdk.api import API

    api_instance = API ( url="https://192.168.3.91",
                         username="admin@internal",
                         password="abc123",
                         ca_file="/etc/pki/ovirt-engine/ca.pem")
    if api_instance.test() == 1:
       print "Connected successfully!"
    else:
       print "didn't connect.try again."

    api_instance.disconnect()
                    

使用Pydoc,可以将ovirtsdk.api所有的方法列出来。

