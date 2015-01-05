# Windows Client配置传统模式USB重定向

若果您从一个Windows物理客户机连接虚拟机，并且想使用USB设备在您的虚拟机上，您必使SPICE
USB重定向。

> **Note**
>
> EayunOS Release Notes

Windows 启用USB重定向

1.  安装USB重定向包在物理客户机

    在一个Windows物理客户机上安装RHEV-USB-Client.exe。下载地址：EayunOS

2.  安装RHEV-Tools在虚拟机

    定位CD驱动访问Guest Tools
    ISO组件，创建RHEV-ToolsSetup.exe。如果在你的CD驱动里没有获取到Guest
    Tools
    ISO，联系管理员。这些工具已经安装完成后，将提示您重启机器应用这些改变。

3.  打开防火墙端口

    在虚拟机和客户机之间连接通过TCP端口号32023。

4.  启用USB共享

    在用户门户，选择虚拟机。确保您的虚拟机已经启用SPICE USB共享。

5.  连接USB设备

    连接进入您的虚拟机，连接一个USB设备。如果要求USB设备不直接呈现在虚拟机桌面上，右键SPICE框选择USB设备，从这个列表下选择您的设备显示方式。如图：

    ![图2](../images/user-usb-2.png)

