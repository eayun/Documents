# 修改 admin@internal 用户的密码

 **概要**<br/>
要想修改内部管理员用户 **(admin@internal)** 的密码，您可以使用  EayunOS 虚拟化管理中心 的配置管理工具。而且，当使用配置管理工具来修改密码时，必须使用交互模式。

1. 使用 **root** 用户登录到  EayunOS 虚拟化管理中心服务器。
1. 使用 **engine-config** 命令为 **admin@internal** 设置新的密码：

 ```
    # engine-config -s AdminPassword=interactive
 ```

  如果密码中有特殊字符，注意使用转义。

1. 重启  EayunOS 虚拟化管理中心使新的密码生效：

```
    # service ovirt-engine restart
```

> **重要**
>
> 目前 EayunOS 已经提供了 Console 界面，可以通过 Console 界面修改 admin@internal 的密码，而不需要通过命令行执行，提供了方便。建议**使用控制台界面**进行密码的修改。

**结果**<br/>
  您已经成功修改了 admin@internal 用户的密码，并且在下次使用时必须使用这个新的密码来登录到管理门户、用户门户或 REST API。
