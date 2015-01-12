# 示例: 使用 Python 附加一个 ISO 镜像到虚拟机中

为了在新创建的虚拟机中安装操作系统, 需要附加一个 ISO 文件到虚拟机中.

ISO 镜像可以在文件列表中显示. 下面的例子列出 ISO 存储域的文件列表.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="https://HOST",
                  username="USER",
                  password="PASS",
                  ca_file="ca.crt")

        sd = api.storagedomains.get(name="iso1")
        iso = sd.files.list()

        for i in iso:
            print "%s" % i.get_name()

    except Exception as ex:
        print "Unexpected error: %s"
            
          

如果请求成功, 将会输出以下结果:

    RHEL6.3-Server-x86_64-DVD1.iso
          

下面的例子把 RHEL6.3-Server-x86\_64-DVD1.iso ISO 文件附加到 vm1 中.

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="HOST",
                  username="USER",
                  password="PASS")

        sd = api.storagedomains.get(name="iso1")

        cd_iso = sd.files.get(name="RHEL6.3-Server-x86_64-DVD1.iso")
        cd_vm = api.vms.get(name="vm1")
        cd_params = params.CdRom(file=cd_iso)

        try:
            cd_vm.cdroms.add(cd_params)
            print "Attached CD to '%s'." % cd_vm.get_name()
        except Exception as ex:
            print "Failed to attach CD to '%s': %s" % (cd_vm.get_name(), ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
    If the add request is successful then the script will output:
            
          

如果 add 请求成功, 将会输出以下结果:

    Attached CD to 'vm1'.
          

> **Note**
>
> 上面的例子附加 ISO 文件到一个 Down 状态的虚拟机.
> 如果要附加到一个运行中的虚拟机, 需要另一个 try 语句.
>
>             
>     try:
>         cdrom=cd_vm.cdroms.get(id="00000000-0000-0000-0000-000000000000")
>         cdrom.set_file(cd_iso)
>         cdrom.update(current=True)
>         print "Attached CD to '%s'." % cd_vm.get_name()
>     except:
>         print "Failed to attach CD to '%s': %s" % (cd_vm.get_name(), ex)
>             
>           

从虚拟机中弹出 cdrom

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API(url="HOST",
                  username="USER",
                  password="PASS")

        sd = api.storagedomains.get(name="iso1")
        vm = api.vms.get(name="vm1")

        try:
            vm.cdroms.get(id="00000000-0000-0000-0000-000000000000").delete()
            print "Removed CD from '%s'." % vm.get_name()
        except Exception as ex:
            print "Failed to remove CD from '%s': %s" % (vm.get_name(), ex)

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

