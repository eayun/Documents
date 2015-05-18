# 作为高可用节点

**摘要**

* Hosted Engine 部署成功后，默认已经有了第一台高可用节点。
* 当需要支持 EayunOS 管理端的高可用时，需要添加更多的高可用节点。

1. 当 Hypervisor 主机配置好网络等必要内容后，可以选择Hosted Engine选项，部署高可用节点。
2. 选择【Additional HA Node】选项并按下【Enter】键，此时【Additional HA Node】选项被选中，主机将作为高可用节点加入到 EayunOS 虚拟化管理中心里。

   如图中所示：

   ![additional_node](../images/additional_node.png)

3. 选择&lt; Setup Hosted Engine &gt;并按下【Enter】键，进入shell交互界面。

   1. 选择存储类型，要与第一台高可用节点的配置一致。

      提示信息如下：

      ```

          Please specify the storage you would like to use (iscsi, nfs3, nfs4)[nfs3]:

      ```

      > **重要**
      >
      > 所输入的存储类型必须是部署**第一台高可用节点时所使用的存储类型**。

   2. 输入存储路径，要与第一台高可用节点的配置一致。

      提示信息如下：

      ```

          Please specify the full shared storage connection path to use (example: host:/path):

      ```

      > **重要**
      >
      > 所输入的存储类型必须是部署**第一台高可用节点时所用的存储路径**。即Engine虚拟机所使用的存储路径。

   3. 输入主机的 ID。

      提示信息如下：

      ```

          Please specify the Host ID [Must be integer, default: 2]:

      ```

      > **注意**
      >
      > 主机 ID 不能重复。

   4. 从第一台主机上获取answer file。

      提示信息如下：

      ```

          Do you want to scp the answer file from the first host? (Yes, No)[Yes]:
          Please provide the FQDN or IP of the first host:
          Enter 'root' user password for host [first_host_ip/FQDN]:

      ```

      输入第一台主机的域名全称或IP地址，并输入第一台主机的root用户密码。

      > **重要**
      >
      > 安装的 EayunOS 虚拟化宿主机默认没有打开 root 用户，需要进入第一台主机的 shell 环境（F2 进入）
      > 然后执行如下命令：
      > ```
      > [root@hyper179 admin]# /usr/libexec/ovirt-config-password
      >
      >
      >  Password Configuration
      >
      >
      > Possible commands:
      > admin  Set the password of the user 'admin'
      > help   Show this help. [`help --all` to show all available functions]
      > q      Quit this tool
      > quit   Quit this tool
      > root   Set the password of the user 'root'
      > ssh    Enable or disable the SSH password authentication
      >
      > [INFO] SSH password authentication is currently enabled
      >
      > > root
      >
      >  Password Configuration
      >
      > System Administrator (root):
      >
      > Changing password for user 'root'.
      > New password:
      > Retype new Password:
      > [WARNING] You have provided a weak password! Strong passwords contain a mix of uppercase, lowercase, numeric and punctuation characters. They are six or more characters long and do not contain dictionary words. Reason: it is too simplistic/systematic
      > [WARNING] File already persisted: /etc/shadow
      > [WARNING] /etc/shadow Already persisted
      > [INFO] Password updated successfully.
      > > q
      > [root@hyper179 admin]#
      > ```

   5. 配置网络。

      提示信息如下：

      ```

          Please indicate a nic to set ovirtmgmt bridge on: (eth0, eth1)[eth0]:

      ```

      选择需要配置桥接的网卡。

   6. 配置高可用节点的名称。

      提示信息如下：

      ```

          Enter the name which will be used to identify this host inside the Administrator Portal [hosted_engine_id]:
          Enter 'admin@internal' user password that will be used for accessing the Administrator Portal:
          Confirm 'admin@internal' user password:

      ```

      输入高可用节点的名称，并输入 EayunOS 虚拟化管理中心的admin密码。

4. 交互内容完成，主机作为高可用节点到 EayunOS 虚拟化管理中心，状态变化为Installing -> Up。

**结果**

高可用节点添加成功，HostedEngine 虚拟机可以运行在这台高可用节点上。
