# 在 Windows 操作系统上安装虚拟机代理和驱动

**概述**<br/>
使用作为 EayunOS 管理端的一个依赖软件包所安装的 ovirt-guest-tools-iso 提供的 **ovirt-tools-setup.iso** ISO 文件可以在 Windows 虚拟机上安装 EayunOS guest 代理和驱动。这个 ISO 文件位于安装了 EayunOS 管理端的系统的 **/usr/share/ovirt-guest-tools/ovirt-guest-tools-3.5_5.iso。

> **注意**
>
> **ovirt-guest-tools-3.5_5.iso** ISO 文件会在运行 **engine-setup** 时被自动复制到默认的 ISO 存储域中。如果没有运行这个命令，您必须手工把它上传到一个 ISO 存储域中。

> **注意**
>
> 最新版本的 **ovirt-guest-tools-3.5_5.iso** ISO 文件需要被手动附加到运行它们的 Windows 虚拟机上，并对工具程序和驱动进行升级。如果在虚拟机上启动了 APT 服务，最新版本的 ISO 文件会被自动附加。

> **注意**
>
> 如果您使用命令行或作为实施工具（如 Windows Deployment Services）的一部分安装了 guest 代理和驱动，您可以在 RHEV-toolsSetup.exe 中使用 ISSILENTMODE 和 ISNOREBOOT 选项。它们可以使 guest 代理和驱动的安装以“安静模式”进行，并可以防止机器在安装完成后马上重启。机器会在整个实施过程完全完成后才重启。```D:\ovirt-guest-toolsSetup.exe ISSILENTMODE ISNOREBOOT```

**在 Windows 上安装 guest 代理**
1. 登录到虚拟机。

2. 选择包括 **ovirt-guest-tools-setup.iso** 文件的 CD。

3. 双击 **RHEV-toolsSetup**。

4. 在欢迎界面中点 **Next**。

5. 在 **User Account Control** 窗口中点 **Yes**。

6. 按照 ovirt-guest-Tools InstallShield Wizard 窗口中的提示进行操作。确认选择了组件列表中的所有选项。

7. 在安装完成后，选 Yes, I want to restart my computer now 并点 Finish。

**结果**<br/>
您安装了 guest 代理和驱动，它们可以把使用信息传递给 EayunOS 管理端，并允许您使用 USB 设备、单点登录以及其它功能。EayunOS guest 代理以一个名为 Agent 的服务运行，您可以使用 ovirt-agent 配置文件对它进行配置。
