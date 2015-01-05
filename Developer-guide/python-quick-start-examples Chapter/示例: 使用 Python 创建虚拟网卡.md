# 示例: 使用 Python 创建虚拟网卡

需要创建一个虚拟网卡并附加到虚拟机中, 虚拟机才能使用网络.

下面的例子创建一个名为 nic 的虚拟网卡. 创建的网卡是这样的:

-   网卡接口类型为 virtio.

                    
        nic_interface = "virtio"
                    
                  

-   连接到 ovirtmgmt 逻辑网络

                    
        nic_network = api.networks.get(name="ovirtmgmt")
                    
                  

在使用 add 方法创建虚拟网卡时, 上面的参数必须设置到虚拟网卡对象中.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        vm = api.vms.get(name="vm1")

        nic_name = "nic1"
        nic_interface = "virtio"
        nic_network = api.networks.get(name="rhevm")

        nic_params = params.NIC(name=nic_name, interface=nic_interface, network=nic_network)

        try:
            nic = vm.nics.add(nic_params)
            print "Network interface '%s' added to '%s'." % (nic.get_name(), vm.get_name())
        except Exception as ex:
            print "Adding network interface to '%s' failed: %s" % (vm.get_name(), ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 add 请求成功, 将会输出以下结果:

    Network interface 'nic1' added to 'vm1'.
          

