# 示例: 使用 Python 创建虚拟机

创建虚拟机分为几个步骤. 第一个步骤是创建虚拟机对象本身.

下面的例子创建一个名为 vm1 的虚拟机. 创建的虚拟机是这样的:

-   最少需要 512 MB 的内存.

                    
        vm_memory = 512 * 1024 * 1024
                    
                  

-   加入 Default 集群和 Default 数据中心中.

                    
        vm_cluster = api.clusters.get(name="Default")
                    
                  

-   基于 Blank 模板.

                    
        vm_template = api.templates.get(name="Blank")
                    
                  

-   从虚拟硬盘启动.

                    
        vm_os = params.OperatingSystem(boot=[params.Boot(dev="hd")])
                    
                  

在使用 add 方法创建虚拟机时, 上面的参数必须设置到虚拟机对象中.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="https://HOST",
                  username="USER",
                  password="PASS",
                  ca_file="ca.crt")

        vm_name = "vm1"
        vm_memory = 512 * 1024 * 1024
        vm_cluster = api.clusters.get(name="Default")
        vm_template = api.templates.get(name="Blank")
        vm_os = params.OperatingSystem(boot=[params.Boot(dev="hd")])

        vm_params = params.VM(name=vm_name,
                             memory=vm_memory,
                             cluster=vm_cluster,
                             template=vm_template,
                             os=vm_os)

        try:
            api.vms.add(vm=vm_params)
            print "Virtual machine '%s' added." % vm_name
        except Exception as ex:
            print "Adding virtual machine '%s' failed: %s" % (vm_name, ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 add 请求成功, 将会输出以下结果:

    Virtual machine 'vm1' added.
          

