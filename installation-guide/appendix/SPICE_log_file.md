# SPICE 日志文件

在整个 EayunOS 虚拟化环境中不同的地方那个都有 SPICE 相关的日志，包括客户端和虚拟机上。

**SPICE 日志文件**

|        日志类型        |        日志位置        |        调整日志级别        |
|------------------------|------------------------|----------------------------|
|SPICE客户端（Windows 7）|%temp%\spicex.log       |<ul><li>右键点击主菜单的“我的电脑”，点击“树形”。</li><li>进入“高级”系统配置，点击“环境变量”。</li><li>找到“用户”或者“系统”变量，新建一个变量“SPICEX_DEBUG_LEVEL”，值为4。</li></ul>|
|SPICE客户端（Windows XP）|C:\Documents and Settings\(User Name)\Local Settings\Temp\spicex.log|<ul><li>右键点击主菜单的“我的电脑”，点击“属性”。</li><li>进入“高级”系统配置，点击“环境变量”。</li><li>找到“用户”或者“系统”变量，新建一个变量“SPICEX_DEBUG_LEVEL”，值为4。</li></ul>|
|SPICE客户端（Linux）    |/var/log/message        |使用SPICE_DEBUG=1 firefox启动Firefox浏览器。|
|EayunOS虚拟化宿主机上的SPICE服务进程|/var/log/libvirt/qemu/(虚拟机名称).log|启动虚拟机之前，首先执行export SPIECE_DEBUG_LEVEL=5。|
