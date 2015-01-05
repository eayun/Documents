# 示例: 使用 Python 列出所有数据中心

API 类提供了访问数据中心集合的方法 datecenters.
该方法收集所有系统中的数据中心.

下面的例子列出所有的数据中心. 关于每个数据中心的一些基本信息也会列出来

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        dc_list = api.datacenters.list()

        for dc in dc_list:
            print "%s (%s)" % (dc.get_name(), dc.get_id())

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

在只有一个默认数据中心存在的环境中, 将会输出以下结果:

    Default (d8b74b20-c6e1-11e1-87a3-00163e77e2ed)
          

