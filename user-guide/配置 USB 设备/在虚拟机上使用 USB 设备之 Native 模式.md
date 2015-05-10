# 在虚拟机上使用 USB 设备之 Native 模式

USB 重定向 Native 模式允许 KVM/SPICE USB 设备被重定向到 Linux 或 Windows 虚拟机上。在使用 native USB 模式时，虚拟机并不需要安装客户端代理或驱动，而客户端所需要的所有软件包都会通过 Firefox 的 SPICE xpi 插件所提供（对于 Windows 客户端，USBClerk 软件包需要被安装）。Native USB 模式在以
下的客户端和虚拟机上被支持：

* **客户端**
  * Red Hat Enterprise Linux 6.0 或更高版本
  * Red Hat Enterprise Linux 5.5 或更高版本
  * Windows XP
  * Windows 7
  * Windows 2008
  * Windows 2008 Server R2

* **虚拟机**
  * Red Hat Enterprise Linux 6.0 或更高版本
  * Red Hat Enterprise Linux 5.5 或更高版本
  * Windows XP
  * Windows 7
  * Windows 2008

> **注意**
>
> 如果您使用 64 位的 PC，您必须使用 64 位版的 Internet Explorer 来安装 64 位的 USB 驱动程序。如果您在 64 位系统上安装了 32 位的驱动，USB 重定向功能将无法正常工作。只要您在原始安装 USB 驱动时使用了正确的版本，以后您就可以通过 32 或 64 位版本的浏览器来使用 USB 重定向功能。
