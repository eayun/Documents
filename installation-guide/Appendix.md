# Engine Console的使用
## Engine Console的介绍

1. 预览信息的介绍

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

1. 配置界面介绍
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

1. 基本配置
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

1. EayunOS高级配置

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

1. 重启或关闭系统
  1. 在主配置界面输入【8】并按下【Enter】键。
  1. 进入重启或关闭的选择界面。

    * 输入【1】并按下【Enter】键，可重启系统。
    * 输入【2】并按下【Enter】键，可关闭系统。

  1. 输入【3】并按下【Enter】键，可返回主配置界面。

* 结果

  系统被重启或关闭。

1. 设置Engine Console的root密码

  可以使用engineadm用户登录Engine Console，设置了root密码后，也可以用root直接登录到shell界面中。


