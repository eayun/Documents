# 安装 Windows 时通过更换 CD 加载驱动

**ovirt-guest-tools-3.5_5.iso** 镜像中包含了以下这些驱动和代理:
* VirtIO-Win drivers
  * VirtIO-Serial
  * VirtIO-Balloon
  * VirtIO-Net
  * VirtIO-Block
  * VirtIO-SCSI
* Spice drivers and agent
* Qemu Guest Agent
* oVirt Guest Agent

**ovirt-guest-tools-3.5_5.iso** 会被包含在 EayunOS 管理端所管理的 WGT_DOMAIN 这个 ISO 存储域中。<br/>
您可以在安装 Windows 时通过在虚拟机上附加一块磁盘的方式来安装 ovirt-guest-tools-3.5_5.iso。

**在安装 Windows 时安装需要的驱动**

1. 在一台刚刚创建好的虚拟机上安装 Windows 操作系统。

2. 如果您添加的硬盘是 Virtio 接口的话，在 Windows 的安装过程中需要加载驱动程序才能够看到您添加的硬盘。

3. 按下 Shift + <F12> 退出当前的安装界面。

4. 在管理端中选择该台虚拟机并点击**更换 CD** 按扭。

5. 在下拉菜单当中选择 **ovirt-guest-tools-3.5_5.iso**，前提是您已经将该镜像上传至该虚拟机所在的数据中心的 ISO 存储域当中了。

6. 回到安装界面，点击**刷新**按扭，然后点击**加载驱动程序**。此时，会弹出**加载驱动程序**的弹出框，点击**确定**。

7. 在**选择要安装的驱动程序**中点击**浏览**按扭。

8. 选择 **CD 驱动器（D：）CDROM** ——> **drivers** ——> **virtio**，然后选择您安装的 Windows 操作系统的版本。

9. * 如果您要安装的 Windows 操作系统是 32 位的，请选择 **x86**，点击**确定**，选择 **Red Hat VirtIO SCSI controller**。
   * 如果您要安装的 Windows 操作系统是 64 位的，请选择 **amd64**，点击**确定**，选择 **VirtIO-Serial Driver**

10. 点击**下一步**。

11. 稍等片刻，你可以看见您添加的那块硬盘。按下 Shift + <F12> 退出安装界面。

12. 选择该虚拟机，点击**更换 CD** 按扭，在下拉列表中选择 Windows 的安装镜像。然后点击**下一步**。

13. 开始安装 Windows。

 
