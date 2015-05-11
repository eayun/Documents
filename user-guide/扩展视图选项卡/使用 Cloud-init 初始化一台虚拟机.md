# 使用 Cloud-init 初始化一台虚拟机

**概述**<br/>
使用 Cloud-Init 来自动配置一个基于模板的 Linux 虚拟机的初始配置。

**使用 Cloud-Init 初始化一台虚拟机**

1. 选**虚拟机**标签页并选择一个虚拟机。

2. 点**只运行一次**打开运行**虚拟机**窗口。

3. 展开**初始运行**项并选择**使用 Cloud-Init**。

4. 在**虚拟机主机名**项中输入主机名。

5. 选**配置时区**并从**时区**下拉菜单中选择所需的时区。

6. Select the Use **already configured password** check box to use the existing credentials, or clear that check box and enter a root password in the **Root Password** and **Verify Root Password** text fields to specify a new root password.

7. 在**SSH 授权密钥**项中输入 SSH 密钥，这个密钥会被添加到虚拟机的授权主机文件中。

8. 选中**重新产生 SSH 密钥**选项来为虚拟机重新产生 SSH 密钥。

9. 在 **DNS 服务器**项中输入 DNS 服务器。

10. 在 **DNS 搜索域**中输入 DNS 搜索域。

11. 选**网络**，并使用 + 和 - 键来为虚拟机添加网络接口或从虚拟机上删除网络接口。

12. 在**自定义脚本**项中输入自定脚本。

13. 点**确定**。

> **重要**
>
> Cloud-Init 只在兼容版本为 3.3 或更高版本的集群中被支持。

**结果**<br/>
在虚拟机启动时进行了特定的配置。
