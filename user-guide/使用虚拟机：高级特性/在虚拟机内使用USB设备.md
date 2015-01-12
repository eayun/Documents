# 在虚拟机内使用USB设备

使用SPICE协议连接的一个虚拟机能配置连接USB设备。这样做，USB设备插入您使用的用于访问一个虚拟机的物理客户机，USB设备重定向显示在您通过用户门户访问的虚拟桌面或是虚拟服务器。

USB重定向本地模式使EayunOS企业Linux和Windows虚拟机可以进行本地KVM/SPICE
USB的重定向。虚对于本地USB，虚拟机不需要任何代理客户端或驱动。虚拟机的这个属性适用于EayunOS企业虚拟化3.1及以上版本。本地USB支持以下物理客户机（clients）和虚拟机（guests）：

1.  物理客户机（Client）

    -   Red Hat Enterprise Linux 6.0 及以上版本

    -   Red Hat Enterprise Linux 5.5 及以上版本

    -   Windows XP

    -   Windows 7

    -   Windows2008

2.  虚拟机（Guest）

    -   Red Hat Enterprise Linux 6.0 及以上版本

    -   Red Hat Enterprise Linux 5.5 及以上版本

    -   Windows XP

    -   Windows 7

-   如果是有管理权限的用户安装SPICE
    ActiveX组件，那么usbclerk服务会自动安装。

-   如果是没有管理权限的用户安装SPICE
    ActiveX组件，那么usbclerk服务必须由一个有管理权限的用户手动安装。usbclerk配置文件在virt-viewer的安装目录下，
    如：C:\\Users\\username\\AppData\\Local\\virt-viewer\\bin\\usbclerksetup.exe.
    双击usbclerk-setup.exe文件，根据提示安装usbclerk。

当usbclerk服务运行安装时，选择一个配置使用SPICE协议的虚拟机，启动它。

在详细面板，点击【编辑】按钮，打开Console Option窗口，勾选中启用USB
Auto-Share。

双击运行的虚拟机连接该虚拟机。当您插入USB设备在您的物理客户机上时
，USB设备将自动重定向显示在您的虚拟机内。

选择一个配置使用SPICE的虚拟机，启动它。

在详细面板，点击【编辑】打开Console Option窗口，勾选中启用USB
Auto-Share。

双击运行的虚拟机连接该虚拟机。当您插入USB设备在您的物理客户机上时，USB设备将自动重定向显示在您的虚拟机内。

