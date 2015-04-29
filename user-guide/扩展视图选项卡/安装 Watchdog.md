# 安装 Watchdog

**概述**<br/>
要激活虚拟机上的 watchdog 卡，您需要在虚拟机上安装 watchdog 软件包，并启动 **watchdog** 服务。

**安装 Watchdog**
1. 登录到 watchdog 卡所在的虚拟机。

2. 运行以下命令来安装 watchdog 软件包：
   ```
   # yum install watchdog
   ```

3. 编辑 **/etc/watchdog.conf** 文件，取消以下行的注释：
   ```
   watchdog-device = /dev/watchdog
   ```

4. 保存所做的改变。

5. 运行以下命令来启动 **watchdog** 服务，并使它可以在系统启动时被自动启动：
   ```
   # service watchdog start
   # chkconfig watchdog on
   ```

**结果**<br/>
您在虚拟机上安装并启动了 **watchdog** 服务
