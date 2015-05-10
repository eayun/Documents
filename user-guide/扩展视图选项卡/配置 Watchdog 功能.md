# 配置 Watchdog 功能

**概述**<br/>
确认 watchdog 卡被连到虚拟机上，watchdog 服务也被启动了。

> **警告**
>
> 以下操作只被用来测试 watchdog 的功能，请不要在实际的生产环境中运行。

**配置 Watchdog 的功能**
1. 登录到 watchdog 卡所连的虚拟机上。

2. 运行以下命令来确定 watchdog 卡已经被虚拟机所识别：
   ```
   # lspci | grep watchdog -i
   ```

3. 运行以下命令之一来确定 watchdog 处于激活状态：
   * 运行以下的命令来产生一个内核 panic：
   ```
   # echo c > /proc/sysrq-trigger
   ```
   * 运行以下命令来终止 watchdog 服务：
   ```
   # kill -9 `pgrep watchdog`
   ```

**结果**<br/>
watchdog 计时器将无法被重置，它将会倒数到 0。当计时器到 0 时，在 **Watchdog 操作**下拉菜单中所指定的操作将会进行。
