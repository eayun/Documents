# 在 Linux 上安装 Remote Viewer 

Remote Viewer 是一个在虚拟机上打开图形控制台的应用程序。它是一个 SPICE 的客户端程序。

**在 Linux 上安装 Remote Viewer**
1. 运行以下命令安装 **spice-xpi** 软件包（spice-xpi 是一个与 Mozilla 插件 API 相兼容的浏览器插件，它用于开启 EayunOS 中用户门户的 SPICE 客户端。当前只在 Linux 操作系统下支持。）：

   ```
   # yum install spice-xpi
   ```

2. 运行以下命令来检查 virt-viewer 软件包是否已经在您的系统上被安装：
   ```
   # rpm -q virt-viewer
   virt-viewer-0.5.2-18.el6_4.2.x86_64
   ```
3. 如果 virt-viewer 软件包还没有被安装，运行以下命令来安装它：

   ```
   # yum install virt-viewer
   ```

3. 重新启动 Firefox。

SPICE 插件被安装。您可以使用 SPICE 协议来连接您的虚拟机。
