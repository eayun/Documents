# 示例: 使用 Python 列出逻辑网络

API 类提供了访问逻辑网络集合的方法 logicalnetworks.
该方法收集所有系统中的逻辑网络.

下面的例子列出所有的逻辑网络. 关于每个逻辑网络的一些基本信息也会列出来

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        n_list = api.logicalnetworks.list()

        for n in n_list:
            print "%s (%s)" % (n.get_name(), n.get_id())

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

在只有一个默认数据中心存在的环境中, 将会输出以下结果:

    ovirtmgmt (00000000-0000-0000-0000-000000000009)
          

