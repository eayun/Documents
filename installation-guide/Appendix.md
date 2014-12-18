* [Engine Console的使用](#Engine Console的使用)
  * [Engine Console的介绍](#Engine Console的介绍)
    * [预览信息的介绍](#预览信息的介绍)
    * [配置界面介绍](#配置界面介绍)
  * [Engine Console的使用介绍](#Engine Console的使用介绍)
    * [EayunOS基本配置](#EayunOS基本配置)
    * [EayunOS高级配置](#EayunOS高级配置)
    * [重启或关闭系统](#重启或关闭系统)
    * [设置Engine Console的root密码](#设置Engine Console的root密码)
* [Hosted Engine命令](#Hosted Engine命令)
  * [Hosted Engine命令的浏览](#Hosted Engine命令的浏览)
  * [hosted-engine命令参数介绍](#hosted-engine命令参数介绍)
* [日志文件](#日志文件)
  * [EayunOS虚拟化管理中心日志文件[(#EayunOS虚拟化管理中心日志文件)
  * [SPICE日志文件](#SPICE日志文件)
  * [EayunOS虚拟化宿主机日志文件](#EayunOS虚拟化宿主机日志文件)

# Engine Console的使用
## Engine Console的介绍
### 预览信息的介绍
1. 预览信息介绍

    连接到Engine Console后，看到的预览信息如下：

        Welcome to the EayunOS 4.1 Engine Appliance.

        To manage your appliance please browse to Web Portal.

            Hostname:           aa.bb.cc
            IP Address:         192.168.2.195
            Netmask:            255.255.252.0
            Gateway:            192.168.0.1
            DNS:                8.8.8.8
            MAC Address:        00:1A:4A:81:E3:67
            System Time:        2014年 10月 17日 星期五 13:30:33 CST
            
            Engine Version:     3.5.0.1
            Engine State:       Running
            Web Portal:         http://192.168.2.195
            
            
        Press any key to continue.


  * Hostname : EayunOS虚拟化管理中心的主机名，进行初始化配置之前，默认主机名是localhost。
  * IP Address : 
  * Netmask : 
  * Gateway : 
  * DNS : 
  * MAC Address : 运行EayunOS虚拟化管理中心的虚拟机的MAC地址。
  * System Time : EayunOS虚拟化管理中心的系统时间。
  * Engine Version : 当前使用的EayunOS虚拟化管理中心的版本信息。
  * Engine State : 当前EayunOS虚拟化管理中心的状态（Running | | ）。
  * Web Portal : 可以通过这个URL访问EayunOS虚拟化管理中心的网页门户。


  > #### 重要

  > #### 重要

### 配置界面介绍
1. 按下任意键，进入配置界面。

  主配置界面如下：

      Advanced Setting

      1) Network Configuration
      2) Test Network Configuration
      3) Set Hostname
      4) Set Date and Time
      5) Hosts File Configuration
      6) Engine Restart
      7) Engine Advance Setting
      8) System Restart or Shutdown
      9) Shell
      10) Summary Information
      11) Help
      12) Log OFF
      
      
      Choose the advanced setting: 

  输入【7】并按下【Enter】键，可以进入高级配置界面。高级配置界面如下：

      Engine Advanced Configuration
      
      
      1) Engine Cleanup 
      2) Engine Setup 
      3) Reset Web Portal 'admin' password 
      4) WGT_DOMAIN initialization
      5) Reset Reports Portal 'admin' user password
      6) Back
      
      
      Choose the advanced setting:


  输入【8】并按下【Enter】键，可以选择重启或关闭系统。

      Restart or Shutdown the System.
      
      1) Restart the System
      2) Shutdown the System
      3) Back
      
      Choose the advanced setting:


1. 配置界面的说明

  * Network Configuration : 配置网络。
  * Test Network Configuration : 测试网络配置。
  * Set Hostname : 配置主机名。
  * Set Date and Time : 设置系统的日期和时间。
  * Hosts File Configuration : 修改hosts配置文件。
  * Engine Restart : 重启engine服务。

  * Engine Advance Setting : 进入高级配置界面。
    * Engine Cleanup : 卸载EayunOS虚拟化管理中心。
    * Engine Setup : 部署或更新EayunOS虚拟化管理中心。
    * Reset Web Portal 'admin' user password : 重置Web Portal的admin用户密码。
    * WGT_DOMAIN initialization : WGT_DOMAIN域的初始化。
    * Reset Reports Portal 'admin' user password : 重置Reports Portal的admin用户密码。
    * Back : 返回主配置界面。

  * System Restart or Shutdown : 重启或关闭系统。
    * Restart the System : 重启系统。
    * Shutdown the System : 关闭系统。
    * Back : 返回主配置界面。

  * Shell : 进入shell界面。
  * Summary Information : 配置预览。
  * Log OFF : 登出系统。

## Engine Console的使用介绍

### EayunOS基本配置
1. 配置网络
  1. 在主配置界面输入【1】并按下【Enter】键。
  1. 进入网络配置界面。

    看到原配置的预览。

        IP Address:	old-ip
        Netmask:	old-netmask
        Gateway:	old-gateway
        DNS:	old-dns

  1. 在`Enter the IP Address or c to cancel:`的提示后面，输入要配置的IP地址，并按下【Enter】键。
  1. 在`Enter the Netmask or c to cancel:`的提示后面，输入要配置的Netmask，并按下【Enter】键。
  1. 在`Enter the Gateway or c to cancel:`的提示后面，输入要配置的Gateway，并按下【Enter】键。
  1. 在`Enter the DNS or c to cancel:`的提示后面，输入要配置的DNS，并按下【Enter】键。
  1. 此时，会对配置有一个预览，给用户提供一个修改的机会。

    用户可以输入【Y】确认修改，或【R】重新配置，或【C】取消配置。

              IP Address:	old-ip	==>	new-ip
              Netmask:	old-netmask	==>	new-netmask
              Gateway:	old-gateway	==>	new-gateway
              DNS:	old-dns	==>	new-dns
              
        Confirm the network configuration ([Y]es/[R]eset/[C]ancel):

  1. 确认修改，输入【Y】并按下【Enter】键，配置网络。配置成功后，自动返回主配置界面。

* 结果

  网络配置成功，返回主配置界面。

1. 测试网络

  Engine Console提供了一个测试网络的选项。可以使用该选项，测试当前Engine的网络连通性。

  1. 在主配置界面输入【2】并按下【Enter】键。
  1. 进入测试网络界面，输入要ping的IP地址，并按下【Enter】键。
  1. 如果网络连通性良好，将返回信息`[test_ip]: Success!`。
  1. 你可以继续输入其他IP地址进行网络连通性测试。如果不需要再进行其他IP的ping测试，可以不输入任何内容，直接按下【Enter】键，退出测是网络界面，回到主配置界面。

1. 配置主机名

  这个选项向用户提供了主机名的修改功能。

  1. 在主配置界面输入【3】并按下【Enter】键。
  1. 进入主机名配置界面，输入要配置的主机名，并按下【Enter】键。
  1. 提示`Set the hostname to "[new_hostname]" ([Y]es/[R]eset/[C]ancel):`。

    * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
    * 输入【R】并按下【Enter】键，即重新配置并留在主机名配置界面。
    * 输入【C】并按下【Enter】键，即取消配置并返回到主配置界面。

    输入【Y】并按下【Enter】键，即确认修改保存并退出。

* 结果

  主机名配置成功，保存配置后回到主配置界面。


1. 配置系统日期和时间

  这个选项允许你配置EayunOS虚拟化管理中心的日期和时间。

  1. 在主配置界面输入【4】并按下【Enter】键。
  1. 进入日期和时间配置界面，进行如下配置：

    * 在`Enter the current date (YYYY-MM-DD) or "c" to Cancel :`的提示后面，用YYYY-MM-DD的格式，输入要配置的日期（即当前的日期），按下【Enter】键。
    * 在`Enter the current time in 24 hour format (HH:MM:SS) or "c" to Cancel :`的提示后面，用HH:MM:SS的格式，输入要配置的时间（即当前的时间），按下【Enter】键。

  1. 提供修改的预览，提示`Apply Date and Time configuration? ([Y]es/[N]o):`，需要用户进行确认。

    * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
    * 输入【N】并按下【Enter】键，即取消配置并返回到主配置界面。

    输入【Y】并按下【Enter】键，即确认修改保存并退出。

* 结果

  系统日期和时间修改成功，更新系统日期和时间，返回到主配置界面。

1. 配置hosts文件

  需要在hosts文件中写好对应的IP域名解析。这个选项提供了hosts文件，可以直接对hosts文件进行修改。

  1. 在主配置界面输入【5】并按下【Enter】键。
  1. 打开hosts文件，根据需要修改hosts文件中的IP域名解析，修改完成后保存退出。

* 结果

  hosts文件修改成功。

1. 重启Engine

  这个选项可以重启engine服务。

  1. 在主配置界面输入【6】并按下【Enter】键。
  1. 提示`Engine Restart ([Y]es/[N]o):`，输入【Y】并按下【Enter】键。
  1. 提示`Engine restart successfully. Press any key to continue.`，按下任意键，退出重启界面，回到主配置界面。

  > #### 注意
  > 当HA服务启动时（部署为完成时HA服务还没有被激活），HA服务检测到engine服务重启，认为engine服务故障，并尝试**重启Hosted Engine虚拟机**，即将整个系统重启。如果不希望系统被重启，需要启用全局维护模式。维护模式详情请参考【维护模式】。

* 结果

  engine服务重启成功。

### EayunOS高级配置

  Engine Console提供了对EayunOS虚拟化管理中心的高级配置选项（即选项【7】），可以对EayunOS虚拟化管理中心进行其他的配置。

  在主界面输入【7】并按下【Enter】键，进入高级配置界面。

1. 配置Web Portal的admin用户密码

  这个选项允许管理员修改管理门户的admin用户密码，而不需要使用命令行修改，提供了方便。

  1. 在高级配置界面输入【3】并按下【Enter】键。
  1. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
  1. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。

    > #### 注意
    > 两次输入的密码应该必须相同。

    > #### 注意
    > 配置好密码后，engine服务会自动重启。因此，不需要管理员手动重启engine服务。但是，管理员也应该注意，如果不希望EayunOS系统被重启，请将系统切换至**全局维护**模式。

* 结果

  重置Web Portal的admin用户密码成功，engine被重启，密码生效，可以使用新密码登录EayunOS虚拟化管理中心。

1. WGT_DOMAIN初始化

  WGT_DOMAIN。。。。。。（说明）

  1. 在高级配置界面输入【4】并按下【Enter】键。
  1. 提示`Please enter the password for admin@internal:`，输入admin用户的密码。
  1. 开始进行初始化，初始化成功后，提示`WGT_DOMAIN initialization successfully.`，说明初始化成功。
  1. 按下任意键继续，则返回高级配置界面。

* 结果

  WGT_DOMAIN初始化成功，能够使用WGT_DOMAIN域，并将该域附加到数据中心里。

1. 重置Reports Portal的admin用户密码

  这个选项允许管理员修改报表门户的admin用户密码，而不需要通过命令行进行修改，提供了方便。

  1. 在高级配置界面中输入【5】并按下【Enter】键。
  1. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
  1. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。
  1. 开始设置密码。设置成功后，提示`...`
  1. 输入任意键回到高级配置界面。

  > #### 注意
  > 两次输入的密码应该必须相同。

  > #### 注意
  > 报表门户（Reports Portal）的admin用户和管理门户（Web Portal）的admin用户不是同一个用户，他们是相互独立的用户，只是用户名相同而已。因此，报表门户的admin密码和管理门户的admin密码可以分别设置，不需要设置为相同的密码。

1. 卸载EayunOS虚拟化管理中心

  在高级配置中提供了卸载选项，能够简单快速地把EayunOS 虚拟化管理中心 环境中的关联文件移除。

  1. 在高级配置界面输入【1】并按下【Enter】键。
  1. 

  > #### 注意
  > 

1. Engine Setup

1. 输入【6】[ 6) Back ]并按下【Enter】键，可返回主配置界面。

### 重启或关闭系统
1. 在主配置界面输入【8】并按下【Enter】键。
1. 进入重启或关闭的选择界面。

  * 输入【1】并按下【Enter】键，可重启系统。
  * 输入【2】并按下【Enter】键，可关闭系统。

1. 输入【3】并按下【Enter】键，可返回主配置界面。

* 结果

  系统被重启或关闭。

### 设置Engine Console的root密码

  可以使用engineadm用户登录Engine Console，设置了root密码后，也可以用root直接登录到shell界面中。

1. 第一次使用root用户登录时，看到`Please login as 'engineadm' to configure the appliance`的提示，在`[your_hostname] login:`的提示后面输入【root】并按下【Enter】键。
1. 提示`....`，让第一次使用root用户登录的用户设置root的密码
1. 。。
1. 。。


# Hosted Engine命令
## Hosted Engine命令的浏览

* 摘要
  * SSH到EayunOS虚拟化管理中心的Hypervisor HA主机命令行终端，可以使用Hosted Engine的命令进行一些操作。

1. SSH到EayunOS虚拟化管理中心的Hypervisor HA主机命令行终端，运行命令`hosted-engine --help`。

  查看hosted-engine命令的帮助信息，如下：

      Usage: /usr/sbin/hosted-engine [--help] <command> [<command-args>]
        --help
            show this help message.
      
        The available commands are:
            --deploy [options]
                run ovirt-hosted-engine deployment
            --vm-start
                start VM on this host
            --vm-start-paused
                start VM on this host with qemu paused
            --vm-shutdown
                gracefully shutdown the VM on this host
            --vm-poweroff
                forcefully poweroff the VM on this host
            --vm-status
                VM status according to the HA agent
            --add-console-password [--password=<password>]
                Create a temporary password for vnc/spice connection.  If
                --password is given, the password will be set to the value
                provided.  Otherwise, if it is set,  the environment variable
                OVIRT_HOSTED_ENGINE_CONSOLE_PASSWORD will be used.  As a last
                resort, the password will be read interactively.
            --check-liveliness
                Checks liveliness page of engine
            --connect-storage
                Connect the storage domain
            --start-pool
                Start the storage pool manually
            --console
                Open the configured console using remote-viewer on localhost
            --set-maintenance --mode=<mode>
                Set maintenance status to the specified mode (global/local/none)
          
        For additional information about a specific command try:
             <command> --help

## hosted-engine命令参数介绍

* hosted-engine --deploy
  * Hosted Engine的部署命令，与在界面上选择< Setup Hosted Engine >的作用相同。

* hosted-engine --vm-start
  * 当运行EayunOS虚拟化管理中心的虚拟机关闭时，可以使用该命令将系统启动，即启动EayunOS虚拟化管理中心虚拟机。

* hosted-engine --vm-start-paused
  * 

* hosted-engine --vm-shutdown
  * 将EayunOS虚拟化管理中心虚拟机关机。

* hosted-engine --vm-poweroff
  * 将EayunOS虚拟化管理中心虚拟机断电。

* hosted-engine --vm-status
  * 查看当前EayunOS虚拟化管理中心虚拟机的状态以及engine服务的状态。

  状态正常时，显示信息如下：

      --== Host 1 status ==--
      
      Status up-to-date                  : True
      Hostname                           : [hosted_engine_1_ip]
      Host ID                            : 1
      Engine status                      : {"health": "good", "vm": "up", "detail": "up"}
      Score                              : 2400
      Local maintenance                  : False
      Host timestamp                     : 245095
      Extra metadata (valid at timestamp):
              metadata_parse_version=1
              metadata_feature_version=1
              timestamp=245095 (Wed Dec  3 22:01:59 2014)
              host-id=1
              score=2400
              maintenance=False
              state=EngineUp

      
      --== Host 2 status ==--
      
      Status up-to-date                  : False
      Hostname                           : [hosted_engine_2_ip]
      Host ID                            : 2
      Engine status                      : {"reason": "vm not running on this host", "health": "bad", "vm": "down", "detail": "unknown"}
      Score                              : 2400
      Local maintenance                  : False
      Host timestamp                     : 14826
      Extra metadata (valid at timestamp):
              metadata_parse_version=1
              metadata_feature_version=1
              timestamp=14826 (Wed Nov 26 18:24:33 2014)
              host-id=2
              score=2400
              maintenance=False
              state=EngineDown


  > #### 提示
  > 该命令可以在任意一台开启了HA服务的HA主机上运行，能够看到除了本机之外的其他HA主机的状态信息。


* hosted-engine --add-console-password
  * 为连接EayunOS的Engine Console控制台设置密码。

  > #### 提示
  > 该命令必须在运行了EayunOS虚拟化管理中心虚拟机的HA主机上执行才有效。

* hosted-engine --check-liveliness
  * 查看engine服务的状态，如果EayunOS管理中心能够正常访问，则状态显示为`Hosted Engine is up!`。

* hosted-engine --connect-storage

* hosted-engine --start-pool

* hosted-engine --console

* hosted-engine --set-maintenance
  * 用法：hosted-engine --set-maintenance --mode=global | local | none
  * 维护模式的解释如下：
    * global模式：全局维护模式。当这个模式设置启用时，所有集群中的高可用代理会无视engine虚拟机的状态，允许管理员运行/关闭/修改engine虚拟机，而不会出现任何对高可用代理有任何干扰的错误。
    * local模式：本地维护模式。当这个模式设置启用时，单个的高可用代理为了让主机进入维护模式（vdsm/engine），会停止虚拟机，且不会去重启它。另一台集群里的主机会试图去启动engine虚拟机， 同时，第一台主机的维护操作可以继续进行。一个快捷的执行这个过程的方法是手动关闭engine虚拟机，因为虚拟机在给定主机上的任何以外关闭会导致那台主机上的高可用代理暂时将自己的score降为0。在这个情况中，管理员应还应该登录到主机，并且进入维护模式，确保score不会恢复，可能导致主机获取engine的虚拟机。
    * none模式：即取消维护模式。设置维护模式为none后，则取消取消维护模式，高可用代理继续监控engine虚拟机的状态。

# 日志文件

## EayunOS虚拟化管理中心日志文件

> ##### 表： 虚拟化管理中心后端服务运行日志


|        日志文件        |        说明        |
|------------------------|--------------------|
|/var/log/ovirt-engine/engine.log|记录EayunOS虚拟化管理中心大部分的活动，包括前端GUI异常、目录服务查询、数据库访问等。|
|/var/log/ovirt-engine/host-deploy|该目录下记录在虚拟化管理中心中添加主机过程中主机初始化 相关的日志。|
|/var/log/eayunos-engine-console.log|记录使用EayunOS虚拟化管理中心控制台对EayunOS管理端进行配置的信息，包括配置成功或配置失败时的信息。|
|/var/log/ovirt-engine-reports|                    |
|/var/log/engine-vm-backup/engine-vm-backup.log||
|/var/log/engine-manage-domains/engine-manage-domains.log||
|/var/log/ovirt-optimizer/ovirt-optimizer.log||


## SPICE日志文件

  在整个EayunOS虚拟化环境中不同的地方那个都有SPICE相关的日志，包括客户端和虚拟机上。

> ##### 表：SPICE日志文件


|        日志类型        |        日志位置        |        调整日志级别        |
|------------------------|------------------------|----------------------------|
|SPICE客户端（Windows 7）|%temp%\spicex.log       |<ul><li>右键点击主菜单的“我的电脑”，点击“树形”。</li><li>进入“高级”系统配置，点击“环境变量”。</li><li>找到“用户”或者“系统”变量，新建一个变量“SPICEX_DEBUG_LEVEL”，值为4。</li></ul>|
|SPICE客户端（Windows XP）|C:\Documents and Settings\(User Name)\Local Settings\Temp\spicex.log|<ul><li>右键点击主菜单的“我的电脑”，点击“属性”。</li><li>进入“高级”系统配置，点击“环境变量”。</li><li>找到“用户”或者“系统”变量，新建一个变量“SPICEX_DEBUG_LEVEL”，值为4。</li></ul>|
|SPICE客户端（Linux）    |/var/log/message        |使用SPICE_DEBUG=1 firefox启动Firefox浏览器。|
|EayunOS虚拟化宿主机上的SPICE服务进程|/var/log/libvirt/qemu/(虚拟机名称).log|启动虚拟机之前，首先执行export SPIECE_DEBUG_LEVEL=5。|

## EayunOS虚拟化宿主机日志文件

> ##### 表：EayunOS虚拟化宿主机日志文件


|        日志文件        |        说明        |
|------------------------|--------------------|
|/var/log/ovirt-hosted-engine-setup/ovirt-hosted-engine-setup-yyyymmddhhmmss.log|部署Hosted Engine时产生的日志。（注：部署Hosted Engine才会有此日志）|
|/var/log/libvirt/libvirtd.log|libvirt日志。          |
|/var/log/vdsm/spm-lock.log|记录主机关于SPM角色申请、释放、更新、更新失败的信息。|
|/var/log/vdsm/vdsm.log  |VDSM（虚拟化管理中心在宿主机上的代理程序）日志。|
|/var/log/vdsm/mom.log   |VDSM MOM（内存overcommit管理）日志。|

