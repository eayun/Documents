# 示例: 使用 Python 访问 API 入口

ovirtsdk 库提供了 API 入口的类.

下面的例子展示了使用 OVIRT 提供的 REST API 连接 OVIRT. 为了连接 OVIRT,
首先需要创建一个 API 的实例, 如果连接成功,
会在屏幕上打印一个连接成功的信息. 最后我们调用 disconnect()
方法来关闭连接.

该 API 的构造函数提供的参数为:

-   连接的管理端的 *url*.

-   需要认证的用户名 *username*

-   需要认证的密码 *password*

-   *ca\_file* 是到证书的路径. 该证书是管理端所发行的证书. 需要从
    *https://HOST/ca.crt* 获取.

当然, 该 API 类的构造函数还有其它参数, 这个例子我们只需要必须的例子.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        print "Connected to %s successfully!" % api.get_product_info().name

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果连接成功, 这个例子会输出:

    Connected to Red Hat Enterprise Virtualization Manager successfully!
          

