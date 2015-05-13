# 在 Windows 操作系统中安装 USB Clerk

**USB Clerk** 提供了一个可以在虚拟机上安装或卸载 Windows USB 驱动的服务。

**在 Windows 系统上安装 USB Clerk**

1. 打开网络浏览器并根据您的系统下载相应的安装程序。

   * USB Clerk for 32-bit Windows：
   ```
   https://[your manager's address]/ovirtengine/services/files/spice/usbclerk-x86.msi
   ```

   * USB Clerk for 64-bit Windows：
   ```
   https://[your manager's address]/ovirtengine/services/files/spice/usbclerk-x64.msi
   ```

2. 打开下载的文件所在的目录。

3. 双击文件图标。

4. 如果出现一个安全提示，点 **Run**。

5. 如果出现用户账户管理控制提示，选 **Yes**。

**结果**<br/>
**USB Clerk** 被安装。当您将 USB 连接到一台虚拟机上或者从一台虚拟机上断开 USB 的连接，根据实际情况 SPICE 客户端会发送请求来为 USB 设备安装或卸载驱动。
