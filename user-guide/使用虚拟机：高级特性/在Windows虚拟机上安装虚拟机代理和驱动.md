# 在 Windows 虚拟机上安装代理和驱动

**概要**

通过 **WGT-3.5_5.iso** 文件，EayunOS 虚拟化管理中心的虚拟机代理和驱动可以安装到 Windows 虚拟机中，这个 **WGT-3.5_5.iso** 文件是由默认的 **WGT_DOMAIN** 提供的，部署完成时已经包含在其中。这个 ISO 文件在 EayunOS 虚拟化管理中心里，其目录是 **/var/lib/exports/iso**。

> **注意**
>
> **WGT-3.5_5.iso** ISO 文件已经默认包含在 **WGT_DOMAIN** 中，系统管理员可以对其进行初始化后，直接附加到 EayunOS 虚拟化管理中心使用。

> **注意**
>
> 新版本的 **WGT-3.5_5.iso** ISO 文件必须手动附加到运行中的 Windows 虚拟机上，来更新工具和驱动的版本。如果在虚拟机上启用了 APT 服务，更新的 ISO 文件将被自动附加。

> **注意**
>
> 如果您通过命令行安装虚拟机驱动或将其作为部署工具（如：Windows 部署服务）的一部分，您可以给 **WGT-3.5_5.iso** 追加 **ISSILENTMODE** 和 **ISNOREBOOT** 选项以静默安装虚拟机代理和驱动，并在安装完成重启时保护虚拟机。虚拟机会在部署过程完成后被重启。
> `D:\RHEV-toolsSetup.exe ISSILENTMODE ISNOREBOOT`

**过程：在 Windows 虚拟机上安装代理和驱动**

1. 登录到虚拟机中。
1. 选择包含 **WGT-3.5_5.iso** 的 CD 驱动。
1. 双击 **RHEV-toolsSetup**。
1. 在欢迎界面上点击 **Next**。
1. 在 **User Account Control** 窗口中点击 **Yes**。
1. 根据 **RHEV-Tools InstallShield Wizard** 窗口的提示进行。确认列表中所有的复选框都勾选上。

  图

1. 安装完成后，选择 **Yes, I want to restart my computer now** 并点击 **Finish** 以使修改生效。

**结果**

您已经安装了虚拟机代理和驱动，虚拟机的一些有用信息可以传递到 EayunOS 虚拟化管理中心并显示在界面上，并允许访问 USB 设备、单点登录和其他功能。EayunOS 虚拟化管理中心虚拟机代理作为服务运行，其名称为 **RHEV Agent**，您可以使用 **rhev-agent** 的配置文件修改相关配置，配置文件的位置在 **C:\Program Files\Redhat\RHEV\Drivers\Agent**。
