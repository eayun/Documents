# 使用 sys-unconfig 封装一台 Linux 虚拟机来为模版的部署做准备

**概述**<br/>
在基于虚拟机创建一个模板前，您必须“封装”这个虚拟机。

**使用 sys-unconfig 封装一个 Linux 虚拟机**
1. 登录到虚拟机。

2. 运行以下命令删除 ssh 主机密钥：
   ```
   # rm -rf /etc/ssh/ssh_host_*
   ```

3. 在 **/etc/sysconfig/network** 中设置 **HOSTNAME=localhost.localdomain**。

4. 从 **/etc/sysconfig/network-scripts/ifcfg-eth\*** 中删除 **HWADDR** 行和 **UUID** 行。

5. 另外，从 **/var/log** 中删除所有日志，从 **/root** 中删除 build 日志。

6. 请运行以下命令：
   ```
   # sys-unconfig
   ```

**结果**<br/>
虚拟机被关机。它已被封装，并可用来创建模板。您可以使用这个模板部署 Linux 虚拟机，不会有与配置文件相关的冲突。
