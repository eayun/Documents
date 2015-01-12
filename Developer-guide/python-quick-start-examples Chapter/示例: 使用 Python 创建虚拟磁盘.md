# 示例: 使用 Python 创建虚拟磁盘

需要创建一个虚拟磁盘并附加到虚拟机中, 虚拟机才能使用存储.

下面的例子创建一个 8GB 大小的 的虚拟磁盘并附加到 vm1 中.
创建的虚拟磁盘是这样的:

-   存储在 data1 数据存储域中

                    
        disk_storage_domain = params.StorageDomains(storage_domain=[api.storagedomains.get(name="data1")])
                    
                  

-   大小为 8GB

                    
        disk_size = 8*1024*1024
                    
                  

-   磁盘类型为系统盘

                    
        disk_type = "system"
                    
                  

-   磁盘接口类型为 virtio

                    
        disk_interface = "virtio"
                    
                  

-   磁盘格式为 cow

                    
        disk_format = "cow"
                    
                  

-   可作为启动盘

                    
        disk_bootable = True
                    
                  

在使用 add 方法创建虚拟磁盘时, 上面的参数必须设置到虚拟磁盘对象中.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="https://HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        vm = api.vms.get(name="vm1")


        sd = params.StorageDomains(storage_domain=[api.storagedomains.get(name="data1")])
        disk_size = 8*1024*1024
        disk_type = "system"
        disk_interface = "virtio"
        disk_format = "cow"
        disk_bootable = True

        disk_params = params.Disk(storage_domains=sd,
                                  size=disk_size,
                                  type_=disk_type,
                                  interface=disk_interface,
                                  format=disk_format,
                                  bootable=disk_bootable)

        try:
            d = vm.disks.add(disk_params)
            print "Disk '%s' added to '%s'." % (d.get_name(), vm.get_name())
        except Exception as ex:
            print "Adding disk to '%s' failed: %s" % (vm.get_name(), ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 add 请求成功, 将会输出以下结果:

    Disk 'vm1_Disk1' added to 'vm1'.
          

