# 示例: 使用 Python 创建 NFS ISO 域

为了安装虚拟机, 必须提供 ISO 安装镜像文件. 在 OVIRT 中, ISO 镜像文件存在
ISO 存储域中.

> **Note**
>
> 下面的例子假设 NFS 服务已经搭建好了. 关于 NFS 服务的搭建请参考 EayunOS
> 管理员文档.

下面的例子展示如何添加一个 NFS ISO 存储域到系统中. 可以分为以下步骤:

1.  首先获得需要附加该存储域的数据中心.

                    
        dc = api.datacenters.get(name="Default")
                    
                  

2.  确定需要用来附加该存储域的主机

                    
        h = api.hosts.get(name="Atlantic")
                    
                  

3.  定义 NFS 存储域的参数. 该例子 NFS 的位置为 192.0.43.10/storage/iso

                    
        s = params.Storage(address="192.0.43.10", path="/storage/iso", type_="nfs")
                    
                  

4.  请求创建存储域, 使用 add 方法. 此外还需要传递以下参数:

    -   存储域的名字.

    -   上面获得的数据中心对象的句柄.

    -   上面获得的主机对象的句柄.

    -   要添加的存储域的类型(data, iso, 或者导出域)

    -   使用的存储格式(v1, v2, 或者 v3)

下面的脚本是上述的一个总结:

            
    from ovirtsdk.api import API
    from ovirtsdk.xml import params

    try:
        api = API (url="HOST",
                   username="USER",
                   password="PASS",
                   ca_file="ca.crt")

        dc = api.datacenters.get(name="Default")
        h = api.hosts.get(name="Atlantic")

        s = params.Storage(address="192.0.43.10", path="/storage/iso", type_="nfs")
        sd_params = params.StorageDomain(name="iso1", data_center=dc, host=h, type_="iso", storage_format="v3", storage=s)

        try:
            sd = api.storagedomains.add(sd_params)
            print "Storage Domain '%s' added (%s)." % (sd.get_name())
        except Exception as ex:
            print "Adding storage domain failed: %s" % ex

        api.disconnect()

    except Exception as ex:
        print "Unexpected error: %s" % ex
            
          

如果 add 请求成功, 该脚本会输出:

    Storage Domain 'iso1' added (789814a7-7b90-4a39-a1fd-f6a98cc915d8).
          

