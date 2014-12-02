# 部署第一台EayunOS Hypervisor主机
## 安装EayunOS Hypervisor
### 启动安装
1. 插入EayunOS Hypervisor安装盘
  1. 启动系统，并确定系统从安装光盘启动。
  1. 出现开机画面。如果不提供输入，EayunOS Hypervisor安装程序会在30秒后，使用默认的内核参数启动（图1. 开机画面）。
  1. 如果需要选择其他菜单，按下【Down】键，选择【Troubleshooting】，按下【Enter】键，进入菜单选项。（图2. 启动菜单）

    * 可选择的菜单有：
      * 
      * 
      * 

  1. 选择【Start EayunOS】，按下【Enter】，以默认的内核参数启动EayunOS Hypervisor。

    或者按下【Tab】键来编辑内核参数。在编辑模式，你可以添加或删除内核参数。内核参数必须用空格分离。设置好需要的内核参数后，直接按下【Enter】键，保存设置并启动系统。如要放弃修改，也可以按下【Esc】键放弃对内核参数所做的任何修改。（图3. 添加启动参数）<br />

    此时，EayunOS在设置的启动模式下启动了。


### 安装EayunOS
1. 菜单操作说明
  1. 方向键（Up，Down，Left，Right）可以选择屏幕上的不同控件。通过【Tab】键来在不同的控件中循环移动。
  1. 一段下划线（_）代表文本栏。可以选择文本栏，在其中输入数据。
  1. 使用一对尖括号（<and>）括起来的标签代表按钮。选择按钮后，可以按下【Enter】键或空格键来激活它。
  1. 使用一对方括号（[and]）括起来的星号（*）或者空格符代表了一个布尔选项。当方括号中间有一个星号的时候代表该项被选，否则就没有被选中。选择或者取消一个布尔选项只需要选中该控件并按空格键就可以了。

1. 安装EayunOS（交互式安装）
  1. 使用准备好的启动盘启动将要安装EayunOS的机器。
  1. 选择【Start EayunOS】，按下【Enter】键，进入安装界面。
  1. 在Installation窗口中，选择< Install Hypervisor 4.1-apha-2 >（要更新内容），按下【Enter】，开始安装流程；或者选择< Quit >放弃安装。
  1. 首先需要对键盘进行相应的配置，需要选择合适的键盘布局。使用【Up】和【Down】键来选择合适的选项，并按【Enter】键保存你的选择。（图（或例）键盘布局配置）
  1. 安装脚本自动识别出系统中的所有的硬盘。帮助选择启动和安装Hypervisor的硬盘。该界面的每一项包含每个硬盘的Location，Device Name 和Size。（图 启动设备选择）

    第一个硬盘选择界面用来选择Hypervisor启动盘。在该界面选择硬盘后，会把Hypervisor的引导程序安装到该硬盘的主引导记录（MBR）。Hypervisor尝试自动检测系统中的硬盘，然后列出可以用来做启动硬盘的设备。你可以通过Other Device选项手动选择一个块设备。

    > #### 重要
    > 所选择的硬盘必须被是一个可引导设备，而且要么在系统BIOS的启动顺序中出现，要么在预存在的引导程序中。

      * 选择自动到检测的设备

        从列表中选择EayunOS的启动硬盘，并按下【Enter】键。

        选择硬盘并按下【Enter】键。这一步保存启动设备的选择并继续下一步的安装。

      * 手动选择设备

        选择< Other Device: >并按下【Enter】键。

        当提示`Please enter one or more disks to use for installing EayunOS Hypervisor`，输入Hypervisor应该启动的块设备的名称。

        > ##### 示例
        > Custom Block Device
        >
        > Please enter one or more disks to use for installing EayunOS Hypervisor. Multiple devices can be separated by comma.
        >
        > Device path:                                /dev/sda_________________________________

        （图 使用其他设备）

        选择< Save >并按下【Enter】键，该操作将保存启动设备并继续下一步安装。

    选定用来安装的硬盘将安装EayunOS Hypervisor。Hypervisor自动检测系统中的硬盘并从选择的设备上进行安装。

      选择< Continue >按钮并按下【Enter】键

  1. 接下来，应该配置EayunOS Hypervisor的存储

    选择或取消`Fill disk with Data partition`。该项是默认选择，如果不选择该项，将会看到磁盘剩余的空间，并允许指定给数据分区分配的大小。

    设置Swap，Config，Logging的大小，以MB为单位。

    如果选择了`Fill disk with Data partition`，Data这一项无法编辑。如果没有选择，你可以为保留空间设置一个数值。输入-1意味着占用所有的剩余空间。

    （图 配置存储）

    选择< Continue >并按下【Enter】键，保存设置并继续下一步操作。

  1. 对存储的设置有一个预览，选择< Confirm >并按下【Enter】，确认存储设置并继续下一步操作。

    （图 确认存储设置）

    > #### 警告
    > 选定的存储设备上的所有的数据都会被破坏。

  1. EayunOS Hypervisor需要设置一个密码，以此来保护admin用户的控制台访问。安装时需要在Password和Confirm Password中输入锁设置的密码，两次密码的填写要一致。

    （图 设置密码）

    最好使用一个强壮的密码。一个强壮的密码可以是大小写字母、数字和标点字符的混合。密码最少6个字符，不能包含目录字符。

    选择< Install >并按下【Enter】键，开始安装Hypervisor到指定的硬盘上。

    （图 开始安装）

* 结果

  当安装结束时，将会提示重启。选择< Reboot >按钮并按下【Enter】键，重启系统。

    （图 安装完毕）

    > #### 注意
    > 移除启动设备，并修改系统启动项，避免重启后又进 入安装流程。


    > #### 注意
    > EayunOS Hypervisor可以在SANS和其他网络存储中保 存客户虚拟镜像。Hypervisor也可以被安装在SANs中， 作为BIOS中的一个启动设备，提供HBA配置许可。


    > #### 注意
    > Hypervisor的安装可以使用多路径设备。SANS和其他网 络存储经常使用多路径。安装的时候默认是开启多路径 的。可以响应scsi_id函数的块设备都是多路径的。这 些设备不包括USB存储设一些老的ATA硬盘。


## 配置EayunOS Hypervisor
### 登录Hypervisor

* 摘要
  * Hypervisor允许在本地控制台登陆，以此来便利安装后的配置过程。

1. 登录Hypervisor
  1. 启动Hypervisor。将出现一个登录提示。

    > ##### 登录提示
    > Please login as 'admin' to configure the node
    >
    > localhost login:

  1. 输入用户名admin，按下【Enter】键。
  1. 输入admin用户的密码，该密码是在你安装Hypervisor过程中所设置的密码，按下【Enter】键。

    （图 登录成功）

* 结果

  你已成功以admin身份登录到Hypervisor中。

### 选择Hypervisor键盘

* 摘要
  * 选择左侧的Keyboard，切换到键盘配置界面。
  * 键盘项允许你配置键盘的布局。

1. 配置Hypervisor的键盘布局
  1. 选择左侧的 Keyboard 项。
  1. 从系统提供的列表中选择键盘布局。

    > ##### 配置键盘布局
    > Keyboard Layout Selection
    >
    > Choose the Keyboard Layout you would like to apply to this system.
    >
    > Current Active Keyboard Layout: U.S. English
    >
    > Available Keyboard Layouts
    >
    > Tamil (Typewriter)
    >
    > Turkish
    >
    > U.S. English
    >
    > U.S. International
    >
    > Ukrainian
    > 
    >
    >
    > \< Save \>

  1. 用方向键调整选项，选择< Save >并按下【Enter】键。

* 结果

  你已经成功配置了键盘选项。

### 观察Hypervisor的状态

1. 选择左侧的 Status 项，可以看到系统当前的状态的简要描述。

  显示信息包括：

    * Hypervisor的当前状态（Status）
    * 网络当前状态（Networking）
    * 按下【F8】键，显示当前日志和报告文件的目的位置
    * 活跃的虚拟机个数（Running VMs）

    （图 显示状态信息）

1. 状态界面也提供了一些按钮，用来观察Hypervisor的更多细节，并该变其中的部分状态。

  按钮的解释：

    * < View Host Key > : 显示了Hypervisor的RSA主机秘钥指纹，和主机秘钥。
    * < Details > : 显示了Hyperviosr使用的CPU的细节，例如CPU的名称和类型。
    * < Lock > : 进观察Hyperviosr的状态入锁屏界面。必须输入正确的用户名和密码才可以解锁并进行其他操作。
    * < Log Off > : 退出当前用户。
    * < Restart > : 重启Hypervisor。
    * < Power Off > : 关闭Hypervisor的电源。

### 配置Hypervisor网络

1. Hypervisor网络配置界面介绍

  选择左侧的Network项，可以配置Hypervisor的网络等信息。

  * 该界面用来配置：

    * Hostname : Hypervisor的主机名。
    * DNS Server : 使用的DNS服务器地址。
    * NTP Server : 使用的NTP服务器地址。
    * Available System NICs : 使用的网络接口。

  * 该网络配置界面也提供了一系列按钮来测试和配置网络接口：

    * < Ping > : 进入界面后允许你ping一个由你指定的IP地址，并且设置ping的次数。
    * < Create Bond > : Create Bond允许你创建网卡之间的绑定。

  （图 网络配置界面）


1. 配置Hypervisor主机名

* 摘要
  * Hypervisor的主机名是可以配置的。

  1. 在Network界面下，选择Hostname一栏，输入主机名。
  1. 选择< Save >并按下【Enter】键，保存主机名配置。
  1. 配置成功后有相关提示，选择< Close >并按下【Enter】键，回到配置界面。

* 结果

  主机名配置成功。


1. 为Hypervisor配置域名服务器

* 摘要
  * Hypervisor支持指定一个或者多个域名服务器，在转换主机名和域名的时候会用到这些服务器。

  1. 设置或者改变主DNS服务器，选择DNS Server1那一栏，并且键入新的主DNS服务器的IP地址。
  1. 设置或者改变备选的DNS服务器，选择DNS Server2那一栏，并且键入行的备用DNS服务器的IP地址。
  1. 选择< Save >并且按下【Enter】键来改变对DNS的配置。

* 结果

  主DNS服务器和备选DNS服务器被改变了。

1. 为Hypervisor配置网络时间协议（NTP）

* 摘要
  * Hypervisor支持指定一个或者多个网络时间协议服务器，以此来保证虚拟机监视器和NTP服务器的系统时钟同步。保证虚拟机监视器和RHEVM的时间资源同步是非常重要的。这可以确保在RHEV环境中的准确时间。时间的同步影响了VM之间的迁移。

  1. 设置或者改变主NTP服务器，选择NTP Server1那一栏，并且键入新的主NTP服务器的IP地址或者主机名。
  1. 设置或者改变备选的NTP服务器，选择NTP Server2那一栏，并且键入行的备用NTP服务器的IP地址或者主机名。
  1. 选择< Save >并且按【Enter】键来改变对NTP的配置。

* 结果

  主NTP服务器和备选NTP服务器被改变了。


1. 配置Hypervisor的网络接口

* 摘要

  每个Hypervisor检测到的网络接口都会显示下面内容：

  * 设备
  * 状态
  * 模式
  * MAC地址

  若要让Hypervisor连接到EayunOS管理端，至少有一个网络接口要配置好。


  1. 设备鉴别

    在Available System NICs处选择一块网卡，并按下【Enter】键，进入网络配置页面。

    （图 网络配置）

    当列表中的每一项所指向的物理设备不明确的时候，Hypervisor可以通过闪物理设备的信号灯来帮助鉴别。为了使用这个工具，选择列表中的一项后，选择< Flash Lights to Identify >键，并按下【Enter】。然后注意哪个物理设备的信号灯开始闪。所选设备的配置界面就会显示出来。

  1. IPv4配置

    Hypervisor支持DHCP和静态网络配置（static）。

    * 动态网络配置（DHCP）

      动态网络配置允许Hypervisor通过DHCP来动态的被分配地址。在IPv4 Settings中选择DHCP选项，并按空格来打开动态IPv4网络配置功能。

    * 静态网络配置

      静态网络配置允许Hypervisor手动分配IP地址。在IPv4 Settings中选择Static选项，并按空格来打开静态IPv4网络配置功能。

      选择static选项会出现IP Address，Netmask，Gateway栏。IP Address，Netmask，Gateway栏必须填写，来完成静态网络的配置。

      * 详细说明必须满足的内容：

        * IP Address : 在该网络中不能已经被使用。
        * Netmask : 需要和网络中其他主机使用的netmask匹配。
        * Gateway : 需要和网络中的其他机器使用的gateway匹配。

      如果你不清楚要使用的IP Address，Netmask或者Gateway，请联系网络管理员或者考虑动态配置。

      > ##### 示例：Static IPv4网络配置
      > IPv4 Settings
      >
      > ( ) Disabled  ( ) DHCP  (\*) Static
      >
      > IP Address: 192.168.122.100_	Netmask: 255.255.255.0_ Gateway: 192.168.1.1_

  1. IPv6设置

    暂不支持IPv6网络，IPv6网络选项必须保持Disabled。

  1. VLAN配置

    如果需要VLAN的话，在VLAN ID一栏为所选的设备填上VLAN的标识符。

  1. 保存网络配置

    当完成了为所选设备配置好所有的网络选项时，必须对配置进行保存。

    1. 选择< Save >并按下【Enter】键保存网络配置。
    1. 配置成功后有相关提示，选择< Close >并按下【Enter】键，回到配置界面。

* 结果

  等待大约30秒，网络配置成功，提示`All changes were applied successfully`，能够使用网络。


### Hypervisor安全配置

* 摘要
  * 选择左侧的Security，切换到安全界面。
  * 安全界面用来修改远程和本地通过admin用户访问的密码。SSH密码认证也可以通过这个界面设置为启用或禁用。


1. 启用SSH密码认证

  为远程访问启用SSH密码认证。选择`Enable SSH password authentication`选项，并用【Enter】键或空格键选择启用。

1. 修改admin密码

  在`Password for the admin user`栏输入一个新的密码。这里，你应该使用一个强壮的密码。

  1. 在Password输入新的admin密码。
  1. 在Confirm Password输入确认密码，保证Password和Confirm Password中输入的内容是一致的。
  1. 选择< Save >并按下【Enter】键，保存配置。

* 结果

  安全配置设置成功，配置更新。


### 配置Hypervisor简单网络管理协议（SNMP）

* 摘要
  * 选择左侧的SNMP，切换到SNMP界面。
  * SNMP界面允许你启用和配置SNMP的密码。

  （图 配置SNMP）

1. 选择`Enable SNMP`栏。
1. 按下【Enter】键或空格键，选择启用SNMP或禁用SNMP。默认SNMP是禁用的。
1. 在`SNMP Password`的Password栏，输入SNMP的密码。
1. 在`SNMP Password`的Confirm Password栏，输入确认密码，保证两次输入密码内容一致。
1. 选择< Save >并按下【Enter】键，保存SNMP配置。

* 结果

  SNMP配置完成。


### 配置Hypervisor通用信息模型

* 摘要
  * 选择左侧的CIM，切换到CIM界面。
  * 启用和配置通用信息模型（CIM）允许你将Hypervisor连接到现有的CIM管理框架中，并监视Hypervisor上虚拟机的运行。

  （图 配置CIM）

1. 选择`Enable CIM`栏。
1. 按下【Enter】键或空格键，选择启用CIM或禁用CIM。默认CIM是禁用的。
1. 在Password栏输入密码。你将使用这个密码来用CIM访问Hypervisor。
1. 在Confirm Password栏重新输入一次密码，保证两次输入密码的内容一致。
1. 选择< Save >并按下【Enter】键，保存CIM配置。

* 结果

  经过设置，Hypervisor可以接受来自CIM使用密码的连接认证。但你要添加你的Hypervisor到你的通用信息模型管理器（CIMOM）。


### 配置Hypervisor日志记录

* 摘要
  * 选择左侧的Logging，切换到Logging界面。
  * Hypervisor创建并维护来大量的日志文件。Logging界面允许配置一个守护进程来自动导入这些日志到远程服务器中。

  （图 配置日志记录）

1. logrotate配置

  程序logrotate可以简化日志文件的管理。当日志文件达到指定文件大小的时候，Hypervisor使用logrotate来对日志进行轮转操作。

  日志的轮转包括当前日志文件的重命名和创建一个新的日志文件。Logging界面中的Logratate Max Log Size的数值就是用来决定当log多大的时候需要轮转的。

  以KB为单位，输入一个数值来设定Logrotate Max Log Size。默认大小是1024KB。

1. rsyslog配置

  rsyslog是一个多线程的syslog守护进程。Hypervisor可以使用rsyslog在网络上传输log文件到远程的syslog守护进程。

  1. 在Server Address一栏输入远端的rsyslog服务器的地址。
  1. 在Server Port一栏输入远端rsyslog服务器的端口。默认端口是514。

1. netconsole配置

  netconsole模块允许内核消息发送到一个远程的机器。Hypervisor使用netconsole在网络上传递内核消息。

  1. 输入服务器的地址。
  1. 输入服务器的端口。默认端口是6666。

1. 保存配置

  选择< Save >并按下【Enter】键，保存日志配置。

* 结果

  日志配置成功。


### 配置Hypervisor的Kernel Dumps

* 摘要
  * 选择左侧的Kdump，切换到Kdump界面。
  * Hypervisor支持当遇到系统失败的时候使用kdump来导出kernel dumps。

  （图 Kdump配置）

1. kdump产生crash dumps可以导出到NFS或者SSH。选择一个更适合你的导出方法并按下【Enter】键或空格键启用它。

  * 导出位置在NFS上

    设置到NFS上之后，crash log会被导出到NFS上。NFS必须是完整的NFS路径（包含域名和目录）。

  * 导出到SSH

    设置导出到SSH，crash log会被导出到SSH存储中。SSH存储必须是完整的SSH登录（包括完整的域名和用户名）。

1. 选择< Save >并按下【Enter】键，保存Kdump配置。

* 结果

  Kdump配置成功。


### 配置Hypervisor远程存储

* 摘要
  * 选择左侧的Remote Storage，切换到远程存储界面。
  * 支持使用iSCSI initiator来进行远程存储。在Remote Storage界面完成对iSCSI initiator的配置。

  （图 配置远程存储）

1. 在iSCSI Initiator名称栏输入initiator名称。

  > ##### 示例：iSCSI Initiator名称
  > iSCSI Initiator Name:
  >
  > iqn.2014-12.eayun.com:target1

1. 选择< Save >并按下【Enter】键，保存远程存储的配置。

* 结果

  远程存储配置成功，配置被更新。


