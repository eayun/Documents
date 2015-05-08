# 为操作系统是 Windows 的虚拟机配置单点登录

要为 Windows 虚拟机配置单点登录功能，您需要在虚拟机上安装 Windows guest agent。oVirt Guest Tools ISO 文件提供了这个 agent。如果您的 ISO 域中没有包括 RHEV-toolsSetup.iso 映像，请联系您的系统管理员。

**为 Windows 虚拟机配置单点登录**
1. 在用户门户的**扩展视图**标签页中，选 Windows 虚拟机。确定虚拟机已经被开启，然后点**更换 CD** 按钮。

2. 从映像列表中选 **RHEV-toolsSetup.iso**。点**确定**。

3. 当您已经添加了 guest 工具程序后，点**控制台**图标来登录到虚拟机。

4. 在虚拟机上，找到包括 guest 工具程序 ISO 文件的 CD 后启动 **RHEV-ToolsSetup.exe**。在这些工具程序被安装后，您会被提示重启您的机器。

>**结果**<br/>
您在 Windows 虚拟机上启用了单点登录。使用一个用户的用户名和密码登录到用户门户，然后就可以使用单点登录功能连接到虚拟机的控制台。您将会自动登录到虚拟机上。
