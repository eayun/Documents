# Linux Client配置传统模式USB重定向

如果您从一个EayunOS企业Linux物理客户机连接一个虚拟机，在物理客户机和虚拟机之间共享USB设备之前，您必须安装几个SPICE包。

在Linux物理客户机上使用USB设备

1.  安装SPICE包在物理客户机

    在您的Linux物理客户机上安装以下包：

    -   spice-usb-share

    -   kmod-kspiceusb-rhel60 for Red Hat Enterprise Linux 6 or
        kmod-kspiceusb-rhel5u6 for Red Hat Enterprise Linux 5

        这些安装包下载地址EayunOS，安装这些包运行以下命令：

            # yum install spice-usb-share km od-kspiceusb
                                                

2.  运行SPICE USB服务：

    开启spiceusbsrvd服务和下载kspiceusb，运行以下命令：

        # service spiceusbsrvd start
                                # m odprobe kspiceusb
                            

3.  安装RHEV-Tools在虚拟机上

    定位CD驱动访问Guest Tools
    ISO组件，创建RHEV-ToolsSetup.exe。如果在你的CD驱动里没有获取到Guest
    Tools
    ISO，联系管理员。这些工具已经安装完成后，将提示您重启机器应用这些改变。

4.  打开防火墙端口

    在虚拟机和客户机之间连接通过TCP端口号32023。

5.  启用USB Auto-Share

    在用户门户，选择您的虚拟机，确认您的虚拟机已经启用SPICE USB
    Auto-Share。

6.  连接USB设备

    连接您的虚拟机。把焦点放在您的虚拟机桌面的SPICE控制台窗口上，然后连接一个USB设备到客户机。USB设备显示在您的虚拟机桌面上。

当您关闭SPICE会话窗口，USB设备将不再与虚拟机共享。

