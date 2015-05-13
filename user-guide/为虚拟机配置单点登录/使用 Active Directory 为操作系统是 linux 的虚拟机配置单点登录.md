# 使用 Active Directory 为操作系统是 linux 的虚拟机配置单点登录

要配置 Red Hat Enterprise Linux 虚拟机使用 GNOME 和 KDE 图形桌面系统和 Active Directory 服务器实现单点登录，您需要在虚拟机上安装 rhevm-guest-agent 软件包，以及和您的 window manager 相关的软件包，并把虚拟机加入到域中。

> **重要**
>
> 以下操作假设您已经有了一个可以正常工作的 Active Directory 设置，而且 Active Directory 域己经被加入到 Manager。另外，您还需要保证 Manager 上的时钟、虚拟机的时钟和 IPA（IdM）所在的系统时钟都在使用 NTP 进行同步。

**为 Linux 虚拟机配置单点登录**

1. 登录到 Red Hat Enterprise Linux 虚拟机。

2. 启用 Red Hat Enterprise Virtualization Agent 频道：

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
   # yum install rhev-agent-gdm-plugin-rhevcred
   ```

5. 运行以下命令来安装 Samba 客户端软件包：

   ```
   # yum install samba-client samba-winbind samba-winbind-clients
   ```

6. 修改虚拟机上的 **/etc/samba/smb.conf** 文件来包括以下内容，把 **DOMAIN** 替换为短域名，把 **REALM.LOCAL** 替换为 Active Directory realm：

   ```
   [global]
   workgroup = DOMAIN
   realm = REALM.LOCAL
   log level = 2
   syslog = 0
   server string = Linux File Server
   security = ads
   log file = /var/log/samba/%m
   max log size = 50
   printcap name = cups
   printing = cups
   winbind enum users = Yes
   winbind enum groups = Yes
   winbind use default domain = true
   winbind separator = +
   idmap uid = 1000000-2000000
   idmap gid = 1000000-2000000
   template shell = /bin/bash
   ```

7. 运行以下命令把虚拟机加入到域中：

   ```
   net ads join -U [user name]
   ```

8. 运行以下命令来启动 **winbind** 服务，并保证它会在系统引导时自动启动：

   ```
   # service winbind start
   # chkconfig winbind on
   ```

9. 运行以下命令来确认系统可以和 Active Directory 进行交流：

   * 验证一个信任的关系已经被创建：

   ```
   # wbinfo -t
   ```

   * 验证您可以列出用户：

   ```
   # wbinfo -u
   ```

   * 验证您可以列出组：

   ```
   # wbinfo -g
   ```

10. 运行以下命令来配置 NSS 和 PAM：

    a. 运行以下命令打开 **Authentication Configuration** 窗口：

    ``` 
    # authconfig-tui
    ```
    b. 选择 **Use Winbind** 选项，选 **Next** 后点 **Enter**。
    c. 选择 **OK** 按钮后点 **Enter**。

**结果**

您在 Linux 虚拟机上启用了单点登录。使用一个用户的用户名和密码登录到用户门户，然后就可以使用单点登录功能连接到虚拟机的控制台。您将会被自动登录到虚拟机上。
