# EayunOS 虚拟化管理中心的部署配置

**摘要**

* Engine Console 提供了一个控制台界面，对 EayunOS 虚拟化管理中心进行相应的配置。
* 可以通过你在 hosted-engine 部署时所选择的控制台类型来连接 Engine Console。
* 本章节只介绍部署所需要的步骤，其他相关使用方法请参考【[Engine Console的使用](https://github.com/eayun/Documents/blob/master/installation-guide/Appendix.md#Engine%20Console%E7%9A%84%E4%BD%BF%E7%94%A8)】章节。

**EayunOS 虚拟化管理中心的部署配置**

1. 连接 Engine Console（vnc连接）

   1. 在安装了图形界面的机器上（如自己的PC），运行命令`/bin/remote-viewer vnc://{hosted_engine_1_ip}:5900`，打开控制台。

      * 其中，hosted_engine_1_ip是上述运行hosted-engine程序的Hypervisor主机的IP地址。

   2. 将提示你输入控制台密码，点击【确定】。

      这个密码在hosted-engine程序中已经给出。这是由VDSM生成的一个随机密码。

      ```

          You can now connect to the VM with the following command:
              /bin/remote-viewer vnc://localhost:5900
          Use temporary password "[password]" to connect to vnc console.

      ```

   **结果**

   你已经连接了 Engine Console 的控制台。

2. 用 engineadm 登录 EayunOS 虚拟化管理中心控制台

   初次登录，需要配置engineadm密码。

   看到提示信息如下：

   > ##### 登录提示信息
   >
   > Please login as 'engineadm' to configure the appliance
   >
   > localhost login:

   1. 在`locaohost login:`输入【engineadm】并按下【Enter】键。
   2. 提示。。。。
   3. 。。。
   4. 登录成功后，看到 EayunOS Appliance的一些信息和配置预览。

      预览信息如下：

      ```

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
      ```

   **结果**

   成功登录到 EayunOS 虚拟化控制台，看到Appliance的预览信息。

3. 初始化配置

   1. 按下任意键，进入主配置界面。

      主配置界面如下：
      ```
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

      ```

      输入【7】并按下【Enter】键，可以进入高级配置界面。高级配置界面如下：
      ```
          Engine Advanced Configuration

          1) Engine Cleanup 
          2) Engine Setup 
          3) Reset Web Portal 'admin' password 
          4) WGT_DOMAIN initialization
          5) Reset Reports Portal 'admin' user password
          6) Reset Database password
          7) Back
          
          Choose the advanced setting:

      ```

      EayunOS 虚拟化管理中心的初始化配置流程为：`1) -> 2) -> 3) -> 7)[3)] -> 7)[6)]` ，即可完成所需配置。

      > **注意**
      >
      > * 配置流程中的7)[3)]指的是7) Engine Advance Setting高级配置界面下的3) Reset Web Portal 'admin' password。
      > * 配置流程中的7)[6)]指的是7) Engine Advance Setting高级配置界面下的6) Reset Database password。

      输入【8】并按下【Enter】键，可以选择重启或关闭系统。
      ```

          Restart or Shutdown the System.
          
          1) Restart the System
          2) Shutdown the System
          3) Back
          
          Choose the advanced setting:

      ```

   2. 配置网络

      1. 在主配置界面输入【1】并按下【Enter】键。
      2. 进入网络配置界面。

         看到当前配置的预览。

         ```

             IP Address:   old-ip
             Netmask:  old-netmask
             Gateway:  old-gateway
             DNS:  old-dns

         ```

      3. 在`Enter the IP Address or c to cancel:`的提示后面，输入要配置的IP地址，并按下【Enter】键。
      4. 在`Enter the Netmask or c to cancel:`的提示后面，输入要配置的Netmask，并按下【Enter】键。
      5. 在`Enter the Gateway or c to cancel:`的提示后面，输入要配置的Gateway，并按下【Enter】键。
      6. 在`Enter the DNS or c to cancel:`的提示后面，输入要配置的DNS，并按下【Enter】键。
      7. 此时，会对配置有一个预览，给用户提供一个修改的机会。

         用户可以输入【Y】确认修改，或【R】重新配置，或【C】取消配置。
         ```

                   IP Address: old-ip  ==> new-ip
                   Netmask:    old-netmask ==> new-netmask
                   Gateway:    old-gateway ==> new-gateway
                   DNS:    old-dns ==> new-dns
                   
             Confirm the network configuration ([Y]es/[R]eset/[C]ancel):

         ```

      8. 确认修改，输入【Y】并按下【Enter】键，配置网络。配置成功后，提示`Network Configuration Successfully. Press any key to continue.`，可以按下任意键返回主配置界面。

         **结果**

         网络配置成功，返回主配置界面。

   3. 测试网络

     Engine Console提供了一个测试网络的选项。可以使用该选项，测试当前Engine的网络连通性。

     1. 在主配置界面输入【2】并按下【Enter】键。
     2. 进入测试网络界面，输入要ping的IP地址，并按下【Enter】键。
     3. 如果网络连通性良好，将返回信息`[test_ip]: Success!`。
     4. 你可以继续输入其他IP地址进行网络连通性测试。如果不需要再进行其他IP的ping测试，可以不输入任何内容，直接按下【Enter】键，退出测试网络界面，回到主配置界面。

   4. 配置主机名

     默认的主机名是localhost，因此，你需要对主机名进行配置。

     1. 在主配置界面输入【3】并按下【Enter】键。
     2. 进入主机名配置界面，输入要配置的主机名，并按下【Enter】键。

     > **重要**
     >
     > 输入的主机名要与上述hosted-engine部署程序中所输入的主机名相同。

     3. 提示`Set the hostname to "[new_hostname]" ([Y]es/[R]eset/[C]ancel):`。

        * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
        * 输入【R】并按下【Enter】键，即重新配置并留在主机名配置界面。
        * 输入【C】并按下【Enter】键，即取消配置并返回到主配置界面。

        输入【Y】并按下【Enter】键，即确认修改保存并退出。

     **结果**

     主机名配置成功，保存配置后回到主配置界面。

   5. EayunOS 高级配置

      Engine Console提供了对 EayunOS 虚拟化管理中心的高级配置选项（即选项【7】），可以对 EayunOS 虚拟化管理中心进行其他的配置。

      在主界面输入【7】并按下【Enter】键，进入高级配置界面。

      1. 配置Web Portal的admin用户密码

      > #### 重要
      > 登录时，在预览界面，看到提示`[ NOTICE ]`和`[ WARNING ]`。这是由于Web Portal的admin用户密码是临时生成的密码，在初始化配置中必须重置Web Portal的admin用户密码，否则 EayunOS 虚拟化管理中心的部署无法正常完成。

      2. 在高级配置界面输入【3】并按下【Enter】键。
      3. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
      4. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。

      > **注意**
      >
      > 两次输入的密码必须相同。

      <br/>
      > **注意**
      >
      > 重置 Web Portal 的 admin 用户密码后，engine 服务会自动重启。

      <br/>
      > **重要**
      >
      > 设置的密码要与在 hosted-engine 部署程序中设置的 admin 密码**一定要匹配**，否则第一台Hypervisor主机将无法访问 EayunOS 虚拟化管理中心，而导致部署失败。

      **结果**

      重置 Web Portal 的 admin 用户密码成功，engine 服务被重启，密码生效，可以使用新密码登录 EayunOS 虚拟化管理中心。

      5. 配置数据库密码

      > **重要**
      >
      > 数据库密码在 EayunOS 虚拟化管理中心虚拟机创建时已经生成，并且设置为某个固定的密码。为了保证数据的安全性，请**务必**重置数据库的密码。

      1. 在高级配置界面数据【6】并按下【Enter】键。
      2. 在`New password:`的提示后面，输入新的数据库密码，并按下【Enter】键。
      3. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。

      > **注意**
      >
      > 两次输入的密码必须相同。

      <br/>
      > **注意**
      >
      > 重置数据库密码后，engine服务会自动重启。

      **结果**

      重置数据库密码成功，engine服务被重启，密码生效。

   > **注意**
   >
   > 配置进行到这里，初始化配置已经结束，能够正常访问并使用 EayunOS 虚拟化管理中心。如果不需要进行其他配置，可以转到【将第一台HA主机加入 EayunOS 虚拟化环境中】章节，继续进行部署。

   <br/>
   > **注意**
   >
   > 若想了解 Engine Console 的其他用法，请参考【[Engine Console的使用](https://github.com/eayun/Documents/blob/master/installation-guide/Appendix.md#Engine%20Console%E7%9A%84%E4%BD%BF%E7%94%A8)】章节。

