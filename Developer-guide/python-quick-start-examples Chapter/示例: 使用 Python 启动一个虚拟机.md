# 示例: 使用 Python 启动一个虚拟机

以下例子使用 start 方法启动一个虚拟机

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="https://HOST",
                  username="USER",
                  password="PASS",
                  ca_file="ca.crt")

        vm = api.vms.get(name="vm1")

        try:
            vm.start()
            print "Started '%s'." % vm.get_name()
        except Exception as ex:
            print "Unable to start '%s': %s" % (vm.get_name(), ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 start 请求成功, 将会输出以下结果:

    Started 'vm1'.
          

