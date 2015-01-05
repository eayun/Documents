# 示例: 使用 Python 列出所有集群

API 类提供了访问集群集合的方法 clusters. 该方法收集所有系统中的集群.

下面的例子列出所有的集群. 关于每个集群的一些基本信息也会列出来

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        c_list = api.clusters.list()

        for c in c_list:
            print "%s (%s)" % (c.get_name(), c.get_id())

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

在只有一个默认集群存在的环境中, 将会输出以下结果:

    Default (99408929-82cf-4dc7-a532-9d998063fa95)
          

