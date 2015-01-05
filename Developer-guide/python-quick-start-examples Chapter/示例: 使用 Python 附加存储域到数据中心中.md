# 示例: 使用 Python 附加存储域到数据中心中

一旦添加了存储域, 在使用之前必须要将存储域添加到数据中心, 并且激活.

下面的例子附加一个数据存储域 data1 和一个 ISO 存储域 iso1
到默认数据中心中. 使用 add 方法来完成该操作.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        dc = api.datacenters.get(name="Default")

        sd_data = api.storagedomains.get(name="data1")
        sd_iso = api.storagedomains.get(name="iso1")

        try:
            dc_sd = dc.storagedomains.add(sd_data)
            print "Attached data storage domain '%s' to data center '%s' (Status: %s)." %
            (dc_sd.get_name(), dc.get_name, dc_sd.get_status().get_state())
        except Exception as ex:
            print "Attaching data storage domain to data center failed: %s." % ex

        try:
            dc_sd = dc.storagedomains.add(sd_iso)
            print "Attached ISO storage domain '%s' to data center '%s' (Status: %s)." %
            (dc_sd.get_name(), dc.get_name, dc_sd.get_status().get_state())
        except Exception as ex:
            print "Attaching ISO storage domain to data center failed: %s." % ex

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 call 调用成功, 该脚本会输出:

    Attached data storage domain 'data1' to data center 'Default' (Status: maintenance).
    Attached ISO storage domain 'iso1' to data center 'Default' (Status: maintenance).
          

