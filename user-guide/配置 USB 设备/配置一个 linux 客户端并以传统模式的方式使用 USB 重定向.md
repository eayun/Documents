# 配置一个 linux 客户端并以传统模式的方式使用 USB 重定向

如果您通过 Red Hat Enterprise Linux 客户端系统连接到一个虚拟机，您需要先安装几个 SPICE 软件包后才可以在客户端和虚拟机间共享 USB 设备。

**使用 Red Hat Enterprise Linux 客户端上的 USB 设备：**
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
   运行以下命令启动 **spiceusbsrvd** 服务，并加载 **kspiceusb** 模块：
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

6. **附加 USB 设备**
   连接到您的虚拟机上。把虚拟机的 SPICE 控制台窗口变为当前的窗口后，在您的客户端系统上插入一个 USB 设备。这个 USB 设备会出现在您的虚拟机桌面上。

当您关闭了 SPICE 连接会话后，USB 设备将不会再被虚拟机共享。


