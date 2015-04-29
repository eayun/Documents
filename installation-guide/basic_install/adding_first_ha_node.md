# 添加第一台高可用节点

**摘要**

* 在【Hosted Engine的部署】章节中，hosted-engine部署程序还在等待完成 EayunOS 虚拟化管理中心的初始化配置。
* 在【 EayunOS 虚拟化管理中心的配置】章节中，已经完成了初始化配置，可以继续进行hosted-engine的部署。

1. 继续进行 Hosted Engine 的部署，同步 Hypervisor 主机和  EayunOS  虚拟化管理中心。

   在 Hosted Engine 部署中，hosted-engine 部署程序还在等待完成 EayunOS 虚拟化管理中心的初始化配置。

   ```

       To continue make a selection from the options below:
       (1) Continue setup - engine installation is complete
       (2) Power off and restart the VM
       (3) Abort setup
      
       (1, 2, 3)[1]:

   ```

   输入【1】并按下【Enter】键，告知hosted-engine部署程序 EayunOS 虚拟化管理中心的初始化配置已经完成，并继续进行下一步操作。

2. 将第一台HA主机加入 EayunOS 虚拟化环境中。

   1. hosted-engine部署程序检测 EayunOS 虚拟化管理中心的状态。

      检测虚拟化管理中心状态，此阶段不需要输入。

          [ INFO  ] Engine replied: DB Up!Welcome to Health Status!

      说明 EayunOS 虚拟化管理中心已经配置完成，能够正常登录和使用。

   2. 将第一台HA主机加入 EayunOS 虚拟化环境的集群里。

      EayunOS 初始化时默认会创建一个Default集群，hosted-engine部署程序检测环境中的所有集群，让用户选择HA主机所加入的集群。

          [ INFO  ] Engine replied: DB Up!Welcome to Health Status!
                    Enter the name of the cluster to which you want to add the host (Default) [Default]: 
          [ INFO  ] Waiting for the host to become operational in the engine. This may take several minutes...

      输入可用的集群名称或直接按下【Enter】键（使用默认集群），将Hosted Engine的Hypervisor主机加入 EayunOS 虚拟化环境的集群里。

   3. 关闭运行 EayunOS 的虚拟机。

      将主机加入集群后，有如下提示：

      ```

          [ INFO  ] Still waiting for VDSM host to become operational...
          [ INFO  ] The VDSM Host is now operational
                    Please shutdown the VM allowing the system to launch it as a monitored service.
                    The system will wait until the VM is down.

      ```

      通过连接到Engine Console控制台，输入【8】[ 8) System Restart or Shutdown ]并按下【Enter】键，进入重启或关闭界面，输入【2】[ 2) Shutdown the System ]并按下【Enter】键，关闭系统。

      ```

          [ INFO  ] Enabling and starting HA services
                    Hosted Engine successfully set up
          [ INFO  ] Stage: Clean up
          [ INFO  ] Stage: Pre-termination
          [ INFO  ] Stage: Termination

      ```

      hosted-engine 部署程序会等待你把 Hosted Engine 虚拟机关闭，完成部署。然后，会通过 HA 服务自动将 Hosted Engine 虚拟机重启，这样，部署才是完整并成功进行的。

**结果**

Hosted Engine 部署完成，第一台 Hypervisor 主机被加到 EayunOS 虚拟化管理中心的环境中。
