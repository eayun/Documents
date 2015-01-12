# 示例: 使用 Python 列出所有主机

API 类提供了访问主机集合的方法 hosts. 该方法收集所有系统中的主机.

下面的例子列出所有的主机.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        h_list = api.hosts.list()

        for h in h_list:
            print "%s (%s)" % (h.get_name(), h.get_id())

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

在只有一个默认主机存在的环境中, 将会输出以下结果:

    Atlantic (5b333c18-f224-11e1-9bdd-00163e77e2ed)
          

