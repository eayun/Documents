# 在虚拟机上使用 USB 设备之传统模式

USB 重定向的老模式可以启用在 Red Hat Enterprise Virtualization 3.0 中使用的 SPICE USB 重定向协议。老模式必须被手工安装。<br/>

老模式在以下的客户端和虚拟机上被支持：
* 客户端
  * Red Hat Enterprise Linux 6.0 或更高版本
  * Red Hat Enterprise Linux 5.5 或更高版本
  * Windows XP
  * Windows 7
  * Windows 2008

* 虚拟机
  * Windows XP
  * Windows 7

**配置 Linux 客户端以老模式使用 USB 重定向功能**
如果您通过 Red Hat Enterprise Linux 客户端系统连接到一个虚拟机，您需要先安装几个 SPICE 软件包后才可以在客户端和虚拟机间共享 USB 设备。

**使用 Red Hat Enterprise Linux 客户端上的 USB 设备**
1. **在客户端上安装 SPICE 软件包**
   在您的 Linux 客户端系统上安装以下软件包：
   * spice-usb-share
   * kmod-kspiceusb-rhel60 for Red Hat Enterprise Linux 6 或
     kmod-kspiceusb-rhel5u6 for Red Hat Enterprise Linux 5
   这些软件包被 Content Delivery Network 所提供，它们包括在与您的 Red Hat Enterprise Linux 版本相对应的 Red Hat Enterprise Linux Supplementary Software 频道中。运行以下命令来安装这些软件包：
   ```
   # yum install spice-usb-share kmod-kspiceusb
   ```

2. **运行 SPICE USB 服务**
   运行以下命令启动 spiceusbsrvd 服务，并加载 kspiceusb 模块：
   ```
   # service spiceusbsrvd start
   # modprobe kspiceusb
   ```

3. **在虚拟机上安装 RHEV-Tools**
   找到包括 Guest Tools ISO 的 CD，运行 **RHEV-ToolsSetup.exe**。如果您没有包括 Guest Tools ISO 的 CD，请联系您的系统管理员。在这些工具程序被安装后，您将会被提示重新启动机器。

4. **打开防火墙端口**
   允许在客户端系统和虚拟机间使用 TCP 端口 32023。

5. **启用 USB 自动共享**
   在用户门户中选择虚拟机。确定您已经为虚拟机选择了“启用 SPICE USB 自动共享”选项。

6. 附加 USB 设备
   连接到您的虚拟机上。把虚拟机的 SPICE 控制台窗口变为当前的窗口后，在您的客户端系统上插入一个 USB 设备。这个 USB 设备会出现在您的虚拟机桌面上。

**列出连接的 USB 设备 - Linux 客户端**
当您关闭了 SPICE 连接会话后，USB 设备将不会再被虚拟机共享。

**配置一个 Windows 客户端通过老模式使用 USB 重定向功能**
如果您从一个 Windows 客户端系统进行连接，并希望在虚拟机上使用 USB 设备，您需要启用 SPICE USB 重定向功能。

> **注意**
>
> 请参阅 EayunOS 管理端发行注记 来获得与您的系统相关的频道名。

**在 Windows 上启用 USB 重定向功能：**
1. **在客户端上安装 USB 重定向软件包**
   在 Windows 客户端上安装 RHEV-USB-Client.exe。这个软件包由 Content Delivery Network 的 Red Hat Enterprise Virtualization Manager (v.3.5 x86_64) 频道所提供（在 Downloads 列表中）。

2. **在虚拟机上安装 RHEV-Tools**
   找到包括 Guest Tools ISO 的 CD，运行 RHEV-ToolsSetup.exe。如果您没有包括 Guest Tools ISO 的 CD，请联系您的系统管理员。在这些工具程序被安装后，您将会被提示重新启动机器。

3. **打开防火墙端口**
   允许在客户端系统和虚拟机间使用 TCP 端口 32023。

4. **启用 USB 共享**
   在用户门户中选择虚拟机。确定您已经为虚拟机选择了“启用 SPICE USB 共享”选项。

5. **附加 USB 设备**
   连接到您的虚拟机，为您的客户端添加一个 USB 设备。如果新添加的 USB 设备没有出现在虚拟机桌面上，在 SPICE 框上点鼠标右键，选择 USB Devices。从所显示的列表中选择您的设备。

**连接的 USB 设备列表**
> **重要**
>
> 当一些 USB 设备被添加到 Windows 客户端系统时，autoplay 窗口会出现，客户端将完全控制新添加的设备，从而使它们无法被虚拟机使用。要避免这个问题的出现，在您的 Windows 客户端系统上禁用 USB autoplay 功能。

> **注意**
>
> 您也可以在 Windows 客户端系统上定义额外的 USB 协议来允许使用或禁止使用特定的 USB 设备。如需更多信息，请参阅 Red Hat Enterprise Virtualization 管理指南中的与 USB Filter Editor 相关的章节。
