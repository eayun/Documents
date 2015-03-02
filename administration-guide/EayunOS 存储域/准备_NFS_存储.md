# 准备 NFS 存储

**概述**<br/>
以下步骤在一台装有 CentOS 6 或者 Fedora 的服务器上运行，准备 NFS 文件共享以供 EayunOS 的数据存储域和导出域使用，如果 EayunOS 系统安装时已经创建了一个 iso 域，则 iso 域可以不用创建。

1. 安装 nfs-utils，该软件包提供了 NFS 工具：
```
# yum install nfs-utils
```

2. 配置启动脚本，使得共享在系统每次启动时都有效：
```
# chkconfig --add rpcbind
# chkconfig --add nfs
# chkconfig rpcbind on
# chkconfig nfs on
```

3. 启动 rpcbind 服务和 nfs 服务：
```
# service rpcbind start
# service nfs start
```

4. 创建数据目录和导出目录：
注意:共享目录的属组和拥有者必须是 vdsm 和 kvm。
```
mkdir -p /exports/data
mkdir -p /exports/export
```

5. 将新创建的目录添加到 **/etc/exports** 文件中。把以下内容添加到 **/etc/exports**:
```
/exports/data *(rw)
/exports/export *(rw)
```

6. 导出存储域:
```
# exportfs -r
```

7. 重新加载 NFS 服务：
因为我们添加了新的共享目录，所以需要重载 NFS 的配置使它生效
```
# service nfs reload
```

8. 创建用户组 **kvm**：
```
# groupadd kvm -g 36
```

9. 创建用户 **vdsm**，并将其添加到 **kvm** 用户组中：
```
# useradd vdsm -u 36 -g 36
```

10. 将您的导出目录的 ownership 设置成 36：36（vdsm：kvm）。这使得 EayunOS 企业级虚拟化管理中心使用由这些导出目录组成的存储域存储数据成为可能。
```
# chown -R 36:36 /exports/data
# chown -R 36:36 /exports/export
```

11. 设置目录的访问权限：
```
# chmod 0755 /exports/data
# chmod 0755 /exports/export
```
**结果**<br/>
NFS 文件共享创建成功，可以将其附加至 EayunOS 管理中心中了。
