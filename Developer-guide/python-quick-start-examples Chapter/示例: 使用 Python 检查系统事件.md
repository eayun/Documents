# 示例: 使用 Python 检查系统事件

OVIRT 会记录很多系统时间的日志. 这些时间日志可以用用户接口,
系统日志文件和 API 访问.

以下例子使用列出所有系统事件.

-   使用 list 方法的 query 参数可以得到所有的事件, 默认情况下 list
    方法只会返回第一页的事件, 最大只有 100 的记录.

-   这里把结果列表逆序排序, 使得可以按照事件的发生时间输出.

<!-- -->

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        event_list = []
        event_page_index = 1
        event_page_current = api.events.list(query="page %s" % event_page_index)

        while(len(event_page_current) != 0):
            event_list = event_list + event_page_current
            event_page_index = event_page_index + 1
            try:
                event_page_current = api.events.list(query="page %s" % event_page_index)
            except Exception as ex:
                print "Error retrieving page %s of list: %s" % (event_page_index, ex)

        event_list.reverse()

        for event in event_list:
            print "%s %s CODE %s - %s" % (event.get_time(),
                                          event.get_severity().upper(),
                                          event.get_code(),
                                          event.get_description())

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果成功, 将会输出以下的类似结果:

    2012-09-25T18:40:10.065-04:00 NORMAL CODE 30 - User admin@internal logged in.
    2012-09-25T18:40:10.368-04:00 NORMAL CODE 153 - VM vm1 was started by admin@internal (Host: Atlantic).
    2012-09-25T18:40:10.470-04:00 NORMAL CODE 30 - User admin@internal logged in.
          

此部分主要是讲解 OVIRT 应用程序指南。

