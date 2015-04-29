# 在 linux 操作系统上安装虚拟机代理和驱动

**概述**<br/>
使用 EayunOS Agent 频道所提供的 rhevm-guest-agent 软件包可以在 Linux 虚拟机上安装 EayunOS guest 代理和驱动。

**在 Linux 虚拟机上安装 guest 代理和驱动(以红帽的操作系统为例)
1. 登录到红帽 Linux 虚拟机。

2. 启用 EayunOS Agent 频道：
   * Red Hat Enterprise Linux 6
   ```
   # subscription-manager repos --enable=rhel-6-server-rhev-agentrpms
   ```
   * Red Hat Enterprise Linux 7
   ```
   # subscription-manager repos --enable=rhel-7-server-rh-commonrpms
   ```

3. 安装 rhevm-guest-agent-common 以及相关的依赖软件：
   ```
   # yum install rhevm-guest-agent-common
   ```

**结果**<br/>
您安装了 guest 代理，它可以把 使用信息传递给 Red Hat Enterprise Virtualization Manager。Red Hat Enterprise Virtualization 代理作为一个名为 **ovirt-guest-agent** 的服务运行，您可以使用 **/etc/** 目录中的 **ovirt-guest-agent.conf** 配置文件对它进行配置。
