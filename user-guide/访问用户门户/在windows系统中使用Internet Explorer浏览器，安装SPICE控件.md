# 在windows系统中使用Internet Explorer浏览器，安装SPICE控件

SPICE
ActiveX组件是需要运行remote-viewer打开一个连接虚拟机的图形控制界面。remote-viewer是一个与SPICE
ActiveX组件安装在一起的SPICE客户端，它们都是spice.cab文件提供的。

1.  第一次您尝试连接虚拟机，浏览器提示您安装SPICE
    ActiveX组件。他将下载一个spice.cab文件，启动时，自动安装SPICE
    ActiveX组件和remote-viewer应用。

2.  接受安装SPICE
    ActiveX组件的提示，IE浏览器将发出一个安全警告，确认你是否要继续。

3.  重启IE浏览器，现在您能使用SPICE连接虚拟机。

> **Important**
>
> 如果您没有管理权限，安装SPICE
> ActiveX组件，您将收到一个说明没有安装usbclerk包的信息。这意思是您能够使用SPICE连接虚拟机，但您不能使用USB设备在您的虚拟机上。如果有需要请联系您的系统管理员安装usbclerk包。

