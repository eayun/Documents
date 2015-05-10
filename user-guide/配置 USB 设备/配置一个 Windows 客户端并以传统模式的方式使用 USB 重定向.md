# 配置一个 Windows 客户端并以传统模式的方式使用 USB 重定向

如果您从一个 Windows 客户端系统进行连接，并希望在虚拟机上使用 USB 设备，您需要启用 SPICE USB 重定向功能。

> **注意**
>
> 请参阅 EayunOS 管理端发行注记来查阅您当前系统所需要的频道名。

**Windows 上启用 USB 重定向功能：**
1. **在客户端上安装 USB 重定向软件包**
   在 Windows 客户端上安装 **RHEV-USB-Client.exe**。这个软件包由 Content Delivery Network 的 **EayunOS 管理端 (v.3.5 x86_64)** 频道所提供（在 **Downloads** 列表中）。

2. **在虚拟机上安装 RHEV-Tools**
   找到包括 Guest Tools ISO 的 CD，运行 **RHEV-ToolsSetup.exe**。如果您没有包括 Guest Tools ISO 的 CD，请联系您的系统管理员。在这些工具程序被安装后，您将会被提示重新启动机器。

3. **打开防火墙端口**
   允许在客户端系统和虚拟机间使用 TCP 端口 32023。

4. **启用 USB 共享**
   在用户门户中选择虚拟机。确定您已经为虚拟机选择了“启用 SPICE USB 共享”选项。

5. **附加 USB 设备**
   连接到您的虚拟机，为您的客户端添加一个 USB 设备。如果新添加的 USB 设备没有出现在虚拟机桌面上，在 SPICE 框上点鼠标右键，选择 **USB Devices**。从所显示的列表中选择您的设备。

![连接的 USB 设备列表](../images/connect_usb_device.png)<br/>
**连接的 USB 设备列表**

> **重要**
>
> 当一些 USB 设备被添加到 Windows 客户端系统时，autoplay 窗口会出现，客户端将完全控制新添加的设备，从而使它们无法被虚拟机使用。要避免这个问题的出现，在您的 Windows 客户端系统上禁用 USB autoplay 功能。

> **注意**
>
> 您也可以在 Windows 客户端系统上定义额外的 USB 协议来允许使用或禁止使用特定的 USB 设备。如需更多信息，请参阅 Red Hat Enterprise Virtualization 管理指南中的与 USB Filter Editor 相关的章节。
