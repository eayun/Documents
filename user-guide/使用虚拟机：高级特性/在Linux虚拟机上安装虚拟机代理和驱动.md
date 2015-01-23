# 在 Linux 虚拟机上安装虚拟机代理和驱动

**概要**

EayunOS 虚拟化管理中心的虚拟机代理和驱动是通过包 **ovirt-guest-agent** 安装在 Linux 虚拟机上的。

**过程：在 Linux 虚拟机上安装虚拟机代理和驱动

1. 登录到要安装代理和驱动的虚拟机上。
1. 配置 **ovirt** 的源，或下载 **ovirt-guest-agent** 的 rpm 包。
1. 安装 **ovirt-guest-agent**。

  如果是配置了 **ovirt** 源，可以执行：

  ```
yum install ovirt-guest-agent
  ```

  如果下载了 **ovirt-guest-agent** 的 rpm 包，可以执行：

  ```
yum localinstall [PATH]
  ```

    * 将其中的 *[PATH]* 替换成 rpm 包的路径。

**结果**

您已经成功安装了虚拟机代理，可以将一些有用的信息传递给 EayunOS 虚拟化管理中心并显示在界面上。EayunOS 的虚拟机代理作为一个服务运行，您可以通过修改 **/etc/** 目录下的 **ovirt-guest-agent.conf** 文件以修改相关配置。
