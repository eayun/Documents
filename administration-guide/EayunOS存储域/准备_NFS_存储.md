# 准备 NFS 存储

**概述**

以下步骤在一台装有 CentOS 6 或者 Fedora 的服务器上运行，准备 NFS
文件共享以供 EayunOS 的数据存储域和导出域使用，如果 EayunOS 系统安装时已经创建了一个 iso 域，则 iso 域可以不用创建。

1.  安装 NFS 软件包

     # yum install nfs-utils

2.  配置 NFS 开机启动

    # chkconfig --add rpcbind
    # chkconfig --add nfs
    # chkconfig rpcbind on
    # chkconfig nfs on

3.  如果是第一次配置，需要手动把 nfs 服务启动

    # service rpcbind start
    # service nfs start

4.  创建共享目录（以 /export/iso 为例子）

 注意:共享目录的属组和拥有者必须是 vdsm 和 kvm。

    # mkdir /exports/iso
    # chown -R 36:36 /exports/iso

5.  配置共享目录

 打开 nfs 的配置文件  **/etc/exports**，添加一行

    /exports/iso * (rw)

6. 导出存储域

    # exportfs -r

7. 重载 NFS 服务

因为我们添加了一个新的共享目录，需要重载 NFS 的配置使它生效

    # service nfs reload


**结果**

NFS 文件共享创建成功，可以将其附加至 EayunOS 管理中心 中了。
