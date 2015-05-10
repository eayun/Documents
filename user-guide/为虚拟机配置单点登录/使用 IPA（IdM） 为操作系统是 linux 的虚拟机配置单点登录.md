# 使用 IPA(IdM) 为操作系统是 linux 的虚拟机配置单点登录

要配置 Linux 虚拟机使用 GNOME 和 KDE 图形桌面系统和 IPA（IdM）服务器实现单点登录，您需要在虚拟机上安装 rhevm-guest-agent 软件包，以及和您的 window manager 相关的软件包。

> **重要**
>
> 以下操作假设您已经有了一个可以正常工作的 IPA 设置，而且 IPA 域己经被加入到 Manager。另外，您还需要保证 Manager 上的时钟、虚拟机的时钟和 IPA（IdM）所在的系统时钟都在使用 NTP 进行同步。

**为 Linux 虚拟机配置单点登录**
1. 登录到 Red Hat Enterprise Linux 虚拟机。

2. 启用所需的频道：
   * Red Hat Enterprise Linux 6
   ``` 
   # subscription-manager repos --enable=rhel-6-server-rhev-agentrpms
   ```
   * Red Hat Enterprise Linux 7
   ```
   # subscription-manager repos --enable=rhel-7-server-rh-commonrpms
   ```

3. 运行以下命令来下载和安装 guest agent 软件包：
   ```
   # yum install rhevm-guest-agent-common
   ```

4. 运行以下命令来安装单点登录软件包：
   ```
   # yum install rhev-agent-pam-rhev-cred
   # yum install rhev-agent-gdm-plugin-rhevcred
   ```

5. 运行以下命令来安装 IPA 软件包：
   ```
   # yum install ipa-client
   ```

6. 运行以下命令，根据提示配置 **ipa-client** 并把虚拟机加入到域中：
   ```
   # ipa-client-install --permit --mkhomedir
   ```

> **注意**
>
> 在使用 DNS obfuscation 的环境中，这个命令应该是：
> ```
  # ipa-client-install --domain=[FQDN] --server==[FQDN]
  ```

7. 获得一个 IPA 用户的详细信息：
   ```
   # getent passwd [IPA user name]
   ```
   它会返回和以下相似的内容：
   ```
   [some-ipa-user]:*:936600010:936600001::/home/[some-ipauser]:/bin/sh
   ```
   在下一步中，您将需要这个信息来为 [some-ipa-user] 创建一个 home 目录。

8. 为 IPA 用户创建一个 home 目录：
   a. 为新用户创建 home 目录：
   ```
   # mkdir /home/[some-ipa-user]
   ```
   b. 为新用户分配它的 home 目录的拥有者权限：
   ```
   # chown 935500010:936600001 /home/[some-ipa-user]
   ```
> **结果**<br>
> 您在 Red Hat Enterprise Linux 虚拟机上启用了单点登录。使用一个用户的用户名和密码登录到用户门户，然后打开启用了单点登录功能的虚拟机的控制台。您将会被自动登录到虚拟机上。
