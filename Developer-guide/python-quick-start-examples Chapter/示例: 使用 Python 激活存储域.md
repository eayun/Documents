# 示例: 使用 Python 激活存储域

一旦添加了存储域, 在使用之前必须要将存储域添加到数据中心, 并且激活.

下面的例子激活数据存储域 data1 和 ISO 存储域 iso1, 使用 activate
方法来完成该操作.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="https://HOST",
                  username="USER",
                  password="PASS",
                  ca_file="ca.crt")

        dc = api.datacenters.get(name="Default")

        sd_data = dc.storagedomains.get(name="data1")
        sd_iso = dc.storagedomains.get(name="iso1")

        try:
            sd_data.activate()
            print "Activated data storage domain '%s' in data center '%s' (Status: %s)." %
                  (sd_data.get_name(), dc.get_name, sd_data.get_status().get_state())
        except Exception as ex:
            print "Activating data storage domain in data center failed: %s." % ex

        try:
            sd_iso.activate()
            print "Activated ISO storage domain '%s' in data center '%s' (Status: %s)." %
                  (sd_iso.get_name(), dc.get_name, sd_iso.get_status().get_state())
        except Exception as ex:
            print "Activating ISO storage domain in data center failed: %s." % ex

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 call 调用成功, 该脚本会输出:

    Activated data storage domain 'data1' in data center 'Default' (Status: active).
    Activated ISO storage domain 'iso1' in data center 'Default' (Status: active).
          

