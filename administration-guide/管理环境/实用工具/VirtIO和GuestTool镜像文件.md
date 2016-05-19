# VirtIO 和 Guest Tool 镜像文件

virt-io win ISO 和 Virtual Floppy Drive (VFD) 镜像文件包含了 Windows 虚拟机的 VirtIO 驱动，而 rhev-tools-setup ISO 包含了 Windows 虚拟机的 Guest Tools，在安装和配置域的时候创建了一个名为 **WGT_DOMAIN** 的 ISO 域，这个 ISO 域中保存了一个 ISO 镜像文件，这个镜像文件可以提供 Windows 需要的驱动和工具。

**WGT_DOMAIN** 的目录是 **/var/lib/exports/iso**。只需要直接附加这个 ISO 域到环境中即可。

> ##### 注意
> WGT_DOMAIN 可以通过 EayunOS Manager 的 Console 界面附加到环境中，具体使用方法请看[这里（还没加链接）]()。

如果您不想使用这个 ISO 域，可以将这个域中的 ISO 文件上传到环境的其他域中。

