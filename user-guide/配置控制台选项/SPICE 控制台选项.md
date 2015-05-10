# SPICE 控制台选项

当 SPICE 连接协议被选择时，以下选项将会在控制台选项窗口中有效。

![控制台选项窗口](../images/spice_console_options.png)<br/>
**控制台选项窗口**

**控制台调用**
* **自动的**：Manager 会自动选择调用控制台的方法。
* **Native 客户**：当连接到虚拟机时，一个文件下载对话框提供了一个文件，使用它来通过 Remote Viewer 打开虚拟机的控制台。
* **浏览器插件**：当连接到虚拟机时，您会使用 Remote Viewer 进行直接连接。
* **SPICE HTML5 浏览器客户（技术预览）**：当连接到虚拟机时，一个浏览器标签页会被打开作为控制台。

**SPICE 选项**
* **Map control-alt-del shortcut to ctrl+alt+end**：选择这个选项可以把 **Ctrl+Alt+Del** 组合键在虚拟机上转换为 **Ctrl+Alt+End** 组合键。
* **启用 USB 自动共享**：选择这个选项自动重定向 USB 设备到虚拟机。如果这个选项没有选择，USB 设备将会被连接到客户端的机器上，而不会连接到虚拟机。要在虚拟机上使用 USB 设备，需要在 SPICE 客户端菜单中手工启用它。
* **以全屏打开**：选择这个选项后，当连接到虚拟机时，虚拟机控制台会自动以全屏模式打开。点 SHIFT+F11 可以在全屏和非全屏模式间切换。
* **启用 SPICE 代理**：选择这个选项来启用 SPICE 代理。
* **启用 WAN 选项**：这个选项只对 Windows 虚拟机有效。它可以为虚拟机控制台启用 WAN 色彩深度和效果，选择它会设置 WAN-DisableEffects 和 WAN-ColorDepth 这两个参数。选择 Enable WAN options 选项会把 Wan-DisableEffects 设为 animation，把色彩深度设为 16 位。

> **重要**
>
> 浏览器插件 选项只在通过 Internet Explorer 访问管理门户和用户门户时有效。这个控制台选项使用 SpiceX.cab 安装程序所提供的 Remote Viewer 版本。对于其它类型的浏览器，Native 客户是默认的控制台选项。这个控制台选项使用 virt-viewer-x86.msi 和 virt-viewer-x64.msi 安装文件所提供的 Remote Viewer 版本。
