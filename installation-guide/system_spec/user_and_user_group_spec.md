# 用户和用户组的要求

1. EayunOS 虚拟化管理中心上的系统用户

   EayunOS 虚拟化管理中心安装时会自动建立以下用户：

   * vdsm 用户，默认 uid 为 36。挂载和访问 NFS 存储域时使用该用户。
   * ovirt 用户，默认 uid 为 108。管理门户的运行使用该用户。

2. EayunOS 虚拟化管理中心上的系统用户组

   EayunOS 虚拟化管理中心安装时会自动建立以下用户组：

   * kvm 用户组，默认 gid 为 36。组成员包括：

      * vdsm 用户。

   * ovirt 用户组，默认 gid 为 108。组成员包括：

      * ovirt 用户。

3. EayunOS 虚拟化宿主机上的系统用户

   EayunOS 虚拟化宿主机安装时会自动以下用户：

   * kvm 用户组，默认 gid 为 36。组成员包括：

      * vdsm 用户。

   * ovirt 用户组，默认 gid 为 108。组成员包括：

      * ovirt 用户。

4. 普通 Linux 系统作为虚拟化宿主机时对系统用户组的要求

   普通 Linux 系统作为虚拟化宿主机时应满足下面的要求：

   * kvm 用户组，默认 gid 为 36。组成员包括：

      * vdsm 用户。
      * sanlock 用户。

   * qemu 用户组，默认 gid 为 107。组成员包括：

      * vdsm 用户。
      * sanlock 用户。
