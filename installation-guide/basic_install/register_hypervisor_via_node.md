# 通过 EayunOS 虚拟化宿主机注册

1. 通过Hypervisor配置界面注册主机

   1. 选择左侧的【EayunOS Manager】。
   2. 在 Management Server栏输入 EayunOS 管理端的IP地址或者完整域名。
   3. 在 Management Server Port输入管理服务器的端口。

      此版本中不再提供默认地端口，默认为None，必须修改服务器端口，才能正常注册。

   4. 不用设置Password和Confirm Password，当管理服务器地址有效的时候这两栏不需要。

      **进行密码配置**

         这实际上是对root密码进行配置。

         1. 在Password栏输入密码。

           建议你使用一个强壮的密码。强壮的密码可以是大小写字母，数字，标点符号的混合。密码最少六个字符，而且不应该出现在字典中。

         2. 在Confirm Password栏重新输入你的密码。

         不用设置Management Server和Management Server Port两栏，只要密码设置了，稍后允许管理器添加Hypervisor就可以了，不需要这两栏。

   5. 选择< Save & Register >并按下【Enter】键，保存配置，并将Hypervisor主机注册到 EayunOS 虚拟化管理中心里。
   6. 提示`All changes were applied successfully.`，说明注册成功。

   **结果**

   EayunOS  Manager配置完成，主机被注册到 EayunOS 虚拟化管理中心。

   > **注意**
   >
   > 如果Hypervisor配置了 EayunOS 的地址，那Hypervisor重启后自动注册到管理器。在 EayunOS 的主机选项卡中可以看到该Hypervisor。必须在 EayunOS 中批准Hypervisor的注册请求，才可以使用该Hypervisor。在下一章节你将了解如何批准一台注册的主机。

2. 批准主机

   1. 打开浏览器，登录 EayunOS 虚拟化管理中心的管理门户。
   2. 点击选择【主机】选项卡，可以看到之前配置的主机。该主机的状态是Pending Approval。
   3. 点菜单中的【批准】按键。出现【编辑和批准主机】对话框。你可以使用该对话框修改该主机的名字，核对它的SSH指纹，也可以修改这台主机将要加入的数据中心和集群，还可以给支持电源管理卡的主机配置电源管理。

      有关电源管理配置的详细信息，参见 EayunOS 管理员手册。

   4. 点击【确定】。如果你还没有配置电源管理，你将会被提示，是否跳过该步骤直接运行，再次点击【确定】。

   **结果**

   该主机的状态变成Installing，安装完成之后，它的状态变成Up。主机成功添加到 EayunOS 虚拟化管理中心环境中。
