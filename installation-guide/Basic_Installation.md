# 部署Hosted Engine
## 部署前的准备

* 条件
  * 安装EayunOS虚拟化管理中心必须确认满足了所有的安装前提，只有所有的条件都满足，才可以开始安装。

在成功安装EayunOS 虚拟化管理中心之前，必须决定：

1. HTTP和HTTPS用来通信的端口，默认的是80和443。
1. 要安装虚拟化管理中心的系统的全称域名（FQDN）。
1. EayunOS管理员账户的密码。
1. 要使用的数据库服务器的位置。

  你可以使用Appliance中定义的本地数据库服务器。

1. 创建虚拟化管理中心的安全认证时候要使用的组织名称。
1. Hosted Engine虚拟机所使用的存储类型，可以是NFS或iSCSI。
1. 连接到虚拟化管理中心的初始化数据中心要使用的存储类型，默认的是NFS。

## 安装EayunOS管理端
### 启动安装
1. 插入EayunOS安装盘
  1. 启动系统，并确定系统从安装光盘启动。
  1. 出现开机画面。如果不提供输入，EayunOS安装程序会在30秒后，使用默认的内核参数启动。

    （图 开机画面）

  1. 如果需要选择其他菜单，按下【Down】键，选择【Troubleshooting】，按下【Enter】键，进入菜单选项。

    （图 启动菜单）

    * 可选择的菜单有：
      * 
      * 
      * 

  1. 选择【Start EayunOS】，按下【Enter】，以默认的内核参数启动EayunOS。

    或者按下【Tab】键来编辑内核参数。在编辑模式，你可以添加或删除内核参数。内核参数必须用空格分离。设置好需要的内核参数后，直接按下【Enter】键，保存设置并启动系统。如要放弃修改，也可以按下【Esc】键放弃对内核参数所做的任何修改。（图 添加启动参数）

    此时，EayunOS在设置的启动模式下启动了。


### 安装EayunOS管理端
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
        > Device path:
        > /dev/sda__________________

        （图 使用其他设备）

        选择< Save >并按下【Enter】键，该操作将保存启动设备并继续下一步安装。

    选定用来安装的硬盘将安装EayunOS。Hypervisor自动检测系统中的硬盘并从选择的设备上进行安装。

      选择< Continue >按钮并按下【Enter】键

  1. 接下来，应该配置EayunOS系统的存储

    选择或取消`Fill disk with Data partition`。该项是默认选择，如果不选择该项，将会看到磁盘剩余的空间，并允许指定给数据分区分配的大小。

    设置Swap，Config，Logging的大小，以MB为单位。

    如果选择了`Fill disk with Data partition`，Data这一项无法编辑。如果没有选择，你可以为保留空间设置一个数值。输入-1意味着占用所有的剩余空间。

    （图 配置存储）

    选择< Continue >并按下【Enter】键，保存设置并继续下一步操作。

  1. 对存储的设置有一个预览，选择< Confirm >并按下【Enter】，确认存储设置并继续下一步操作。

    （图 确认存储设置）

    > #### 警告
    > 选定的存储设备上的所有的数据都会被破坏。

  1. EayunOS系统需要设置一个密码，以此来保护admin用户的控制台访问。安装时需要在Password和Confirm Password中输入锁设置的密码，两次密码的填写要一致。

    （图 设置密码）

    最好使用一个强壮的密码。一个强壮的密码可以是大小写字母、数字和标点字符的混合。密码最少6个字符，不能包含目录字符。

    选择< Install >并按下【Enter】键，开始安装Hypervisor到指定的硬盘上。

    （图 开始安装）

* 结果

  当安装结束时，将会提示重启。选择< Reboot >按钮并按下【Enter】键，重启系统。

    （图 安装完毕）

    > #### 注意
    > 移除启动设备，并修改系统启动项，避免重启后又进入安装流程。

    > #### 注意
    > EayunOS Hypervisor可以在SANS和其他网络存储中保存客户虚拟镜像。Hypervisor也可以被安装在SANs中， 作为BIOS中的一个启动设备，提供HBA配置许可。

    > #### 注意
    > Hypervisor的安装可以使用多路径设备。SANS和其他网络存储经常使用多路径。安装的时候默认是开启多路径的。可以响应scsi_id函数的块设备都是多路径的。这些设备不包括USB存储设一些老的ATA硬盘。

## Hosted Engine的部署
### Hosted Engine的部署
1. 安装说明

  目前提供的是基于EayunOS Appliance的部署。

    * EayunOS Appliance存放的目录为`/usr/share/EayunOS-Engine-Appliance/`
    * 不支持其他方式的部署

1. 部署前配置
  1. 以admin身份登录到EayunOS系统中
    1. 输入用户名admin，按下【Enter】键。
    1. 输入admin用户的密码，该密码是在你安装EayunOS系统过程中所设置的密码，按下【Enter】键。

      （图 登录成功）

  1. 配置主机名（FQDN）
  1. 配置EayunOS系统的网络接口
  1. 配置EayunOS安全选项

1. 部署Hosted Engine

  当EayunOS系统安装完成并进行了相应的配置后，就可以进行Hosted Engine的部署了。这个部署命令将进行一些交互，询问你一系列问题，并根据你的回答配置Hosted Engine的环境。当向它提供需要的数据后，它将启动一台虚拟机，作为EayunOS虚拟化管理中心的管理端。

  本章节提供一些主要步骤引导你完成Hosted Engine的部署。每个交互中包含几个需要用户输入的步骤。每一步都会在方括号中提供建议默认值。你可以按下【Enter】键同意使用这些默认值并进入下一个步骤，也可以选择填写括号中的其他值来进行配置。

  1. 选择左侧的Hosted Engine，切换到Hosted Engine界面。

    （图 Hosted Engine界面）

  1. 在Engine ISO/OVA Location一栏填写EayunOS Appliance的存放路径：`/usr/share/EayunOS-Engine-Appliance/EayunOS-Engine-Appliance-4.1-Beta-1411260328.ova.gz`。（内容需要根据最终版本进行更改）
  1. 选择< Setup Hosted Engine >并按下【Enter】键，开始部署Hosted Engine。
  1. 提示`Begin Hosted Engine Setup`，选择< Ok >并按下【Enter】键，确定部署。
  1. 进入命令行的交互界面。
    1. 选择Hosted Engine虚拟机所使用的存储类型，默认存储类型是nfs3。

      * 选择nfs3，使用NFS存储

        填写nfs3或直接按下【Enter】键

            Please specify the storage you would like to use (iscsi, nfs3, nfs4)[nfs3]: 

        输入NFS存储的路径，按下【Enter】键

            Please specify the full shared storage connection path to use (example: host:/path):storage-server:/path

      * 选择iscsi，使用iSCSI存储

        填写iscsi，按下【Enter】键

            Please specify the storage you would like to use (iscsi, nfs3, nfs4)[nfs3]: 


        。。。。。。

    1. 安装检测

      hosted-engine检测所选择的存储路径，如果未被使用，则作为第一台主机部署Hosted Engine。

          [ INFO  ] Installing on first host
                    Please provide storage domain name. [hosted_storage]: 
                    Local storage datacenter name is an internal name and currently will not be shown in engine's admin UI.Please enter local datacenter name [hosted_datacenter]: 

      运行EayunOS虚拟化管理中心的Hosted Engine虚拟机会被加入到一个名为hosted_datacenter（可自己定义名称）里，使用的存储为hosted_storage（可自己定义名称）。

      * 当检测到存储已经被使用，则作为Hosted Engine环境的HA主机而部署，询问用户时候作为additional host而加入到EayunOS虚拟化管理中心环境中。相关内容将在【部署HA主机】中进行解释和介绍。

    1. 网络配置

      系统会自动检测你所有的网络接口，在此网络接口上建立桥接。在建立桥接之前，系统将会询问你希望在那个网卡上建立桥接。

          Please indicate a nic to set ovirtmgmt bridge on: (eth0) [eth0]: 
      
      hosted-engine部署程序将会检查你的防火墙配置，帮你打开主机与虚拟化管理中心通信所需要的端口。如果不允许hosted-engine修改iptables的配置，那就必须手动打开EayunOS Hypervisor主机所需要的这些端口。

          iptables was detected on your computer, do you wish setup to configure it? (Yes, No)[Yes]: 

      需要提供一个正确的网关地址。
      
          Please indicate a pingable gateway IP address [192.168.0.1]: 

    1. 检查EayunOS Appliance

      hosted-engine会检查EayunOS Appliance中的一些内容，确认一些需要的信息。在这一阶段不需要输入。

          [ INFO  ] Checking OVF archive content (could take a few minutes depending on archive size)
          [ INFO  ] Checking OVF XML content (could take a few minutes depending on archive size)

      检测到系统所支持的CPU类型，需要用户选择要使用的CPU类型。这里，我们使用默认的model_SandyBridge即可。

          The following CPU types are supported by this host:
                 - model_SandyBridge: Intel SandyBridge Family
                 - model_Westmere: Intel Westmere Family
                 - model_Nehalem: Intel Nehalem Family
                 - model_Penryn: Intel Penryn Family
                 - model_Conroe: Intel Conroe Family
          Please specify the CPU type to be used by the VM [model_SandyBridge]: 

      hosted-engine自动检测到系统的MAC地址，需要用户进行确认。

          You may specify a unicast MAC address for the VM or accept a randomly generated default [00:16:3e:10:f7:6f]: 

    1. 选择连接Hosted Engine虚拟机所使用的控制台类型

      支持的控制台类型有vnc和spice。默认选择的是vnc。

          Please specify the console type you would like to use to connect to the VM (vnc, spice) [vnc]: 

    1. 配置这台Hypervisor主机在EayunOS虚拟化管理中心中的主机名称

      当部署完成后，当前运行部署程序的主机会被加入到EayunOS虚拟化管理中心里。你需要配置这台主机的名称，默认名称是hosted_engine_1。

          Enter the name which will be used to identify this host inside the Administrator Portal [hosted_engine_1]: 

    1. 设置EayunOS虚拟化管理中心的管理门户密码

      当前进行部署的是Hosted Engine的第一台Hypervisor主机，即EayunOS虚拟化管理中心并不运行在这台Hypervisor主机上，而是运行在通过该hosted-engine程序创建的一台虚拟机上，我们已经使用EayunOS Appliance对其进行了封装。

      而在此设置EayunOS虚拟化管理中心的管理门户密码是为了告知这台主机你要设置的管理中心密码。当部署完成以后，hosted-engine程序会将这台主机加入到EayunOS虚拟化管理中心环境中。因此，密码必须设置正确，如果密码设置错误或不一致，会导致添加该主机失败。

          Enter 'admin@internal' user password that will be used for accessing the Administrator Portal: 
          Confirm 'admin@internal' user password: 

    1. 输入EayunOS虚拟化管理中心的域名全称（FQDN）

      在Hosted Engine架构中，部署完成时，EayunOS虚拟化管理中心的HA主机会通过HA服务验证EayunOS管理端的运行状态。此时，HA服务需要知晓EayunOS虚拟化管理中心的FQDN，以进行验证。如果FQDN的配置不正确或没有配置，会导致验证失败，部署不能完整地完成。

          Please provide the FQDN for the engine you would like to use.
          This needs to match the FQDN that you will use for the engine installation within the VM.
          Note: This will be the FQDN of the VM you are now going to create,
          it should not point to the base host or to any other existing machine.
          Engine FQDN: 

    1. 配置报告服务（SMTP）？？

      需要配置报告服务的主机名、TCP端口、email地址和接收email的地址。

          Please provide the name of the SMTP server through which we will send notifications [localhost]: 
          Please provide the TCP port number of the SMTP server [25]: 
          Please provide the email address from which notifications will be sent [root@localhost]: 
          Please provide a comma-separated list of email addresses which will get notifications [root@localhost]: 

    1. 配置完成，对配置进行预览和确认

      hosted-engine会验证你的所有答案，并警告你可能发生的问题。

          [ INFO  ] Stage: Setup validation
          [WARNING] Cannot validate host name settings, reason: resolved host does not match any of the local addresses

      在预览阶段，hosted-engine会给你展示你所输入的配置，并提供修改的机会。如果你选择运行，即直接按下【Enter】键（默认为【Yes】），hosted-engine会进行安装并创建EayunOS虚拟化管理中心的虚拟机。

          --== CONFIGURATION PREVIEW ==--
         
          Bridge interface                   : eth0
          Engine FQDN                        : engine.testing1
          Bridge name                        : ovirtmgmt
          SSH daemon port                    : 22
          Firewall manager                   : iptables
          Gateway address                    : 192.168.0.1
          Host name for web application      : hosted_engine_1
          Host ID                            : 1
          Image alias                        : hosted_engine
          Image size GB                      : 8
          Storage connection                 : 192.168.3.85:/home/test/test
          Console type                       : vnc
          Memory size MB                     : 4096
          MAC address                        : 00:16:3e:10:f7:6f
          Boot type                          : disk
          Number of CPUs                     : 4
          OVF archive (for disk boot)        : /usr/share/EayunOS-Engine-Appliance/EayunOS-Engine-Appliance-4.1-Beta-1411260328.ova.gz
          CPU Type                           : model_SandyBridge
         
          Please confirm installation settings (Yes, No)[Yes]: 

    1. 创建运行EayunOS虚拟化管理中心的虚拟机

      hosted-engine会对配置和EayunOS Appliance进行处理，使用Appliance创建一台虚拟机。这台虚拟机已经安装部署好EayunOS虚拟化管理中心，但你需要对它进行一些配置。

      你需要通过控制台打开这台虚拟机，进行EayunOS虚拟化管理中心的配置。详细过程请看【engine-console的使用】。

          [ INFO  ] Creating VM
                    You can now connect to the VM with the following command:
                        /bin/remote-viewer vnc://localhost:5900
                    Use temporary password "8474yKhl" to connect to vnc console.
                    Please note that in order to use remote-viewer you need to be able to run graphical applications.
                    This means that if you are using ssh you have to supply the -Y flag (enables trusted X11 forwarding).
                    Otherwise you can run the command from a terminal in your preferred desktop environment.
                    If you cannot run graphical applications you can connect to the graphic console from another host or connect to the console using the following command:
                    virsh -c qemu+tls://Test/system console HostedEngine

      此时，hosted-engine会等待你对EayunOS虚拟化管理中心配置完成。配置完成后，输入【1】，按下【Enter】键，即可继续进行下一步操作。

      在这里，我们先转入下一章节，对EayunOS虚拟化管理中心进行配置，配置完成后再回到hosted-engine的部署程序中继续未完成的操作。请看【engine-console的使用】。

          If you need to reboot the VM you will need to start it manually using the command:
          hosted-engine --vm-start
          You can then set a temporary password using the command:
          hosted-engine --add-console-password
          Please install and setup the engine in the VM.
          You may also be interested in installing ovirt-guest-agent-common package in the VM.
          To continue make a selection from the options below:
          (1) Continue setup - engine installation is complete
          (2) Power off and restart the VM
          (3) Abort setup
         
          (1, 2, 3)[1]:


### EayunOS虚拟化管理中心的配置（Engine Console的使用）

* 摘要
  * Engine Console提供了一个控制台界面，对EayunOS虚拟化管理中心进行相应的配置。
  * 可以通过你在hosted-engine部署时所选择的控制台类型来连接Engine Console。

1. 连接Engine Console（vnc连接）

    1. 在安装了图形界面的机器上（如自己的PC），运行命令`/bin/remote-viewer vnc://{hosted_engine_1_ip}:5900`，打开控制台。

      * 其中，hosted_engine_1_ip是上述运行hosted-engine程序的Hypervisor主机的IP地址。

    1. 将提示你输入控制台密码，点击【确定】。

      这个密码在hosted-engine程序中已经给出。这是由VDSM生成的一个随机密码。

          You can now connect to the VM with the following command:
              /bin/remote-viewer vnc://localhost:5900
          Use temporary password "[password]" to connect to vnc console.

* 结果

    你已经连接了Engine Console的控制台。

1. 用engineadm登录EayunOS虚拟化管理中心控制台

    初次登录，需要配置engineadm密码。

    看到提示信息如下：

    > ##### 登录提示信息
    > Please login as 'engineadm' to configure the appliance
    >
    > localhost login:

    1. 在`locaohost login:`输入【engineadm】并按下【Enter】键。
    1. 提示。。。。
    1. 。。。
    1. 登录成功后，看到EayunOS Appliance的一些信息和配置预览。

      （图 Engine Console配置预览）

* 结果

  成功登录到EayunOS虚拟化控制台，看到Appliance的预览信息。按下任意键可以进入进行配置。

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

  EayunOS虚拟化管理中心的初始化配置流程为：`1) -> 2) -> 3) -> 7)[3)]` ，即可完成所需配置。


  > #### 提示
  > 配置流程中的7)[3)]指的是7) Engine Advance Setting高级配置界面下的3) Reset Web Portal 'admin' password。


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

1. 初始化配置
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

    默认的主机名是localhost，因此，你需要对主机名进行配置。

    1. 在主配置界面输入【3】并按下【Enter】键。
    1. 进入主机名配置界面，输入要配置的主机名，并按下【Enter】键。

    > #### 重要
    > 输入的主机名要与上述hosted-engine部署程序中所输入的主机名相同。

    1. 提示`Set the hostname to "[new_hostname]" ([Y]es/[R]eset/[C]ancel):`。

      * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
      * 输入【R】并按下【Enter】键，即重新配置并留在主机名配置界面。
      * 输入【C】并按下【Enter】键，即取消配置并返回到主配置界面。

      输入【Y】并按下【Enter】键，即确认修改保存并退出。

  * 结果

    主机名配置成功，保存配置后回到主配置界面。

  1. EayunOS高级配置

    Engine Console提供了对EayunOS虚拟化管理中心的高级配置选项（即选项【7】），可以对EayunOS虚拟化管理中心进行其他的配置。

    在主界面输入【7】并按下【Enter】键，进入高级配置界面。

    1. 配置Web Portal的admin用户密码

    > #### 重要
    > 登录时，在预览界面，看到提示`...`。这是由于Web Portal的admin用户密码是临时生成的密码，在初始化配置中必须重置Web Portal的admin用户密码，否则EayunOS虚拟化管理中心无法正常登录。

      1. 在高级配置界面输入【3】并按下【Enter】键。
      1. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
      1. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。


      > #### 注意
      > 两次输入的密码应该必须相同。

      > #### 注意
      > 配置好密码后，engine会自动重启。

      > #### 重要
      > 设置的密码要与在hosted-engine部署程序中设置的admin密码**一定要匹配**，否则第一台Hypervisor主机将无法访问EayunOS虚拟化管理中心，而导致部署失败。


    * 结果

      重置Web Portal的admin用户密码成功，engine被重启，密码生效，可以使用新密码登录EayunOS虚拟化管理中心。


  > #### 提示
  > 配置进行到这里，初始化配置已经结束，能够正常访问并使用EayunOS虚拟化管理中心。如果不需要进行其他配置，可以转到【将第一台HA主机加入EayunOS虚拟化环境中】章节，继续进行部署。


1. 其他配置选项说明
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

  1. 高级配置中的其他选项说明
    1. 在主配置界面输入【7】并按下【Enter】键，进入高级配置界面。
      1. WGT_DOMAIN初始化

        WGT_DOMAIN。。。。。。（说明）

        1. 在高级配置界面输入【4】并按下【Enter】键。
        1. 提示`Please enter the password for admin@internal:`，输入admin用户的密码。
        1. 开始进行初始化，初始化成功后，提示`WGT_DOMAIN initialization successfully.`，说明初始化成功。
        1. 按下任意键继续，则返回高级配置界面。

      1. 重置Reports Portal的admin用户密码

        （说明）

        1. 在高级配置界面中输入【5】并按下【Enter】键。
        1. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
        1. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。
        1. 开始设置密码。设置成功后，提示`...`
        1. 输入任意键回到高级配置界面。

      > #### 注意
      > 两次输入的密码应该必须相同。

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



### 将第一台HA主机加入EayunOS虚拟化环境中

* 摘要
  * 在【Hosted Engine的部署】章节中，hosted-engine部署程序还在等待完成EayunOS虚拟化管理中心的初始化配置。
  * 在【EayunOS虚拟化管理中心的配置（Engine Console的使用）】章节中，已经完成了初始化配置，可以继续进行hosted-engine的部署。

1. 继续进行Hosted Engine的部署

  在Hosted Engine部署中，hosted-engine部署程序还在等待完成EayunOS虚拟化管理中心的初始化配置。

      To continue make a selection from the options below:
      (1) Continue setup - engine installation is complete
      (2) Power off and restart the VM
      (3) Abort setup
     
      (1, 2, 3)[1]:

  输入【1】并按下【Enter】键，告知hosted-engine部署程序EayunOS虚拟化管理中心的初始化配置已经完成，并继续进行下一步操作。

1. 将第一台HA主机加入EayunOS虚拟化环境中

  1. hosted-engine部署程序检测EayunOS虚拟化管理中心的状态。

    检测虚拟化管理中心状态，此阶段不需要输入。

        [ INFO  ] Engine replied: DB Up!Welcome to Health Status!

    说明EayunOS虚拟化管理中心已经配置完成，能够正常登录和使用。

  1. 将第一台HA主机加入EayunOS虚拟化环境的集群里。

    EayunOS初始化时默认会创建一个Default集群，hosted-engine部署程序检测环境中的所有集群，让用户选择HA主机所加入的集群。

        [ INFO  ] Engine replied: DB Up!Welcome to Health Status!
                  Enter the name of the cluster to which you want to add the host (Default) [Default]: 
        [ INFO  ] Waiting for the host to become operational in the engine. This may take several minutes...

    输入可用的集群名称或直接按下【Enter】键（使用默认集群），将Hosted Engine的Hypervisor主机加入EayunOS虚拟化环境的集群里。

  1. 关闭运行EayunOS的虚拟机。

    将主机加入集群后，有如下提示：

        [ INFO  ] Still waiting for VDSM host to become operational...
        [ INFO  ] The VDSM Host is now operational
                  Please shutdown the VM allowing the system to launch it as a monitored service.
                  The system will wait until the VM is down.

    通过连接到Engine Console控制台，输入【8】[ 8) System Restart or Shutdown ]并按下【Enter】键，进入重启或关闭界面，输入【2】[ 2) Shutdown the System ]并按下【Enter】键，关闭系统。

        [ INFO  ] Enabling and starting HA services
                  Hosted Engine successfully set up
        [ INFO  ] Stage: Clean up
        [ INFO  ] Stage: Pre-termination
        [ INFO  ] Stage: Termination

    hosted-engine部署程序会等待你把Hosted Engine虚拟机关闭，完成部署。然后，会通过HA服务自动将Hosted Engine虚拟机重启，这样，部署才是完整并成功进行的。

* 结果

  Hosted Engine部署完成，第一台Hypervisor主机被加到EayunOS虚拟化管理中心的环境中。

### 访问管理员门户
* 摘要
  * 部署完成后，可以使用web浏览器访问管理员门户。

1. 打开客户系统上一个web浏览器。
1. 把https://your-manager-fqdn/ovirt-engine中的your-manager-fqdn用安装时候设置的完整域名（FQDN）替换。第一次访问的时候，需要为浏览器和服务器间的安全连接的证书添加信任。
1. 转到门户标题页面。点击【管理门户】，显示登录页面。
1. 输入你的用户名和密码。如果第一次登录，使用admin用户和初始化配置时设置的密码登录。
1. 从域列表中选择要认证的目录服务域，如果使用的是内部的admin用户，就选择internal域。
1. 管理员门户可以支持多种语言，默认的选项是根据浏览器的语言设置的，如果需要其他语言，在下拉列表中选择。
1. 点击【登录】按钮。

* 结果

  已经成功登录管理员门户。


# 部署EayunOS Hypervisor主机
## 安装EayunOS Hypervisor
### 启动安装
1. 插入EayunOS Hypervisor安装盘
  1. 启动系统，并确定系统从安装光盘启动。
  1. 出现开机画面。如果不提供输入，EayunOS Hypervisor安装程序会在30秒后，使用默认的内核参数启动。

    （图 开机画面）

  1. 如果需要选择其他菜单，按下【Down】键，选择【Troubleshooting】，按下【Enter】键，进入菜单选项。

    （图 启动菜单）

    * 可选择的菜单有：
      * 
      * 
      * 

  1. 选择【Start EayunOS】，按下【Enter】，以默认的内核参数启动EayunOS Hypervisor。

    或者按下【Tab】键来编辑内核参数。在编辑模式，你可以添加或删除内核参数。内核参数必须用空格分离。设置好需要的内核参数后，直接按下【Enter】键，保存设置并启动系统。如要放弃修改，也可以按下【Esc】键放弃对内核参数所做的任何修改。（图 添加启动参数）

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
        > Device path:                                /dev/sda____________

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
      > IP Address: 192.168.122.100_    Netmask: 255.255.255.0_    Gateway: 192.168.1.1_

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


## 将EayunOS Hypervisor添加到EayunOS管理端

* 摘要
  * 如果服务器IP地址有效，你可以直接将Hypervisor连接到EayunOS。
  * 如果管理器还没有安装，你需要先设置一个密码。一旦管理器安装了，你就可以从管理员入口添加Hypervisor。
  * Hypervisor用户接口的EayunOS Manager界面同时支持处理这两种情况。

> #### 重要
> EayunOS Manager界面的设置密码功能可以在Hypervisor上设置root的密码并允许SSH密码认证。一旦Hypervisor被成功的添加到管理器上，那最好禁用SSH密码认证功能。

### 注册Hypervisor主机

1. 通过Hypervisor配置界面注册主机
  1. 选择左侧的oVirt Engine。
  1. 在Management Server栏输入EayunOS管理端的IP地址或者完整域名。
  1. 在Management Server Port输入管理服务器的端口。

    默认值是443。如果EayunOS安装的时候选择了一个不同的端口，在这里指定一个新值来替换默认值。

  1. 不用设置Password和Confirm Password，当管理服务器地址有效的时候这两栏不需要。

    * 进行密码配置

      这其实是对root密码进行配置。

      1. 在Password栏输入密码。

        建议你使用一个强壮的密码。强壮的密码可以是大小写字母，数字，标点符号的混合。密码最少六个字符，而且不应该出现在字典中。

      1. 在Confirm Password栏重新输入你的密码。

      不用设置Management Server和Management Server Port两栏，只要密码设置了，稍后允许管理器添加Hypervisor就可以了，不需要这两栏。

  1. 选择< Save & Register >并按下【Enter】键，保存配置，并将Hypervisor主机注册到EayunOS虚拟化管理中心里。
  1. 提示`All changes were applied successfully.`，说明注册成功。

* 结果

  EayunOS Manager配置完成，主机被注册到EayunOS虚拟化管理中心。

> #### 注意
> 如果Hypervisor配置了EayunOS的地址，那Hypervisor重启后自动注册到管理器。在EayunOS的主机选项卡中可以看到该Hypervisor。必须在EayunOS中批准Hypervisor的注册请求，才可以使用该Hypervisor。在下一章节你将了解如何批准一台注册的主机。


1. 批准主机
  1. 打开浏览器，登录EayunOS虚拟化管理中心的管理门户。
  1. 点击选择【主机】选项卡，可以看到之前配置的主机。该主机的状态是Pending Approval。
  1. 点菜单中的【批准】按键。出现【编辑和批准主机】对话框。你可以使用该对话框修改该主机的名字，核对它的SSH指纹，还可以给支持电源管理卡的主机配置电源管理。

    有关电源管理配置的详细信息，参见EayunOS管理员手册。

  1. 点击【确定】。如果你还没有配置电源管理，你将会被提示，是否跳过该步骤直接运行，再次点击【确定】。

* 结果

  该主机的状态变成Installing，安装完成之后，它的状态变成UP。主机成功添加到EayunOS虚拟化管理中心环境中。

### 通过webadmin添加主机

1. 打开浏览器，登录EayunOS虚拟化管理中心的管理门户。
1. 点击选择【主机】选项卡，点击菜单中的【新建】按键。
1. 出现【新建主机】对话框，选择要加入的数据中心和集群，输入主机名称、注释和IP地址。
1. 在【验证】处选择密码，输入主机的root密码

> #### 注意
> 需要配置了root密码，才能使用这种方式添加主机。

1. 点击【高级参数】，你可以勾选使用JSON协议，点击获取SSH指印等。还可以给支持电源管理管理卡的主机配置电源管理。

  有关电源管理配置的详细信息，参见EayunOS管理员手册。

1. 点击【确定】。如果你还没有配置电源管理，你将会被提示，是否跳过该步骤直接运行，再次点击【确定】。

* 结果

  成功添加一台主机，该主机的状态为Installing，安装完成之后，它的状态变成UP。


## 添加Hosted Engine的HA主机

* 摘要
  * Hosted Engine部署成功后，默认已经有了第一台HA主机。
  * 当需要更多的HA主机，以支持EayunOS管理端的高可用时，需要添加更多的HA主机。

1. 当Hypervisor主机配置好网络等内容后，可以选择Hosted Engine选项，部署HA主机。
1. 
