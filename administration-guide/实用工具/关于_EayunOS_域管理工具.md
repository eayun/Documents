# 关于 EayunOS 域管理工具

EayunOS 虚拟化环境使用目录服务对用户进行管理和验证。要在 EayunOS 虚拟化环境中添加用户，首先通过 **admin@internal** 用户为 EayunOS 虚拟化管理中心配置目录服务。添加、删除目录服务时使用 **engine-manage-domains** 命令。

engine-manage-domains 命令只能在 Red Hat Enterprise Virtualization Manager 所在的机器上被访问，并只能使用 root 用户来执行。

> **重要**

> 目前的 EayunOS 支持直接通过管理门户使用域控管理，而不需要命令行进行操作，但是命令行的方式是仍然支持的。建议使用管理门户进行相关操作。
