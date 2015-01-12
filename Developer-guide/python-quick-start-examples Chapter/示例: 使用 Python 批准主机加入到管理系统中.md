# 示例: 使用 Python 批准主机加入到管理系统中

在主机配置过程中, 主机会被加入到管理系统中. 一旦主机加入到管理系统中,
管理系统需要同意该主机的加入, 这样才能在系统中使用.

下面的例子展示如何调用 approve 方法.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="HOST",
                  username="USER",
                  password="PASS",
                  ca_file="ca.crt")

        h = api.hosts.get(name="Atlantic")

        if(h.approve()):
            print "Host '%s' approved (Status: %s)." % (h.get_name(), h.get_status().get_state())
        else:
            print "Approval of '%s' failed." % h.get_name()

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 approval 请求成功, 该脚本会输出:

    Host 'Atlantic' approved (Status: Up).
          

