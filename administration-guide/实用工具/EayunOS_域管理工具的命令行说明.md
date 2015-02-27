# EayunOS 域管理工具的命令行说明

命令的使用方法如下：

```
engine-manage-domains ACTION [options]
```

可用的操作（ACTION）有：

* ***add***

  为 EayunOS Manager 添加目录服务。

* ***edit***

  编辑 EayunOS Manager 中的目录服务。

* ***delete***

  为 EayunOS Manager 删除目录服务。

* ***validate***

  验证 EayunOS Manager 中的目录服务。该操作会使用之前配置的用户和密码对所有目录服务进行验证尝试。

* ***list***

  列出 EayunOS Manager 中的目录服务。

以下的命令行选项可以配合具体的操作一同使用：

* ***--add-permissions***

  如果指定，那么该添加的域用户在 EayunOS Manager 环境中拥有 ***SuperUser*** 的权限。默认情况下，这个选项是不指定的，***SuperUser*** 的角色不会分配给域用户。***--add-permissions*** 选项是可选的。这个选项只有配合 ***add*** 和 ***edit*** 操作使用才有效。

* ***--change-password-msg=[MSG]***

  当用户的登录密码过期时，向用户返回这条指定的消息。这允许您将用户引导到一个指定的URL（必须以 http 或 https 开头），以修改他们的密码。***--change-password-msg*** 选项是可选的，并且只有配合 ***add*** 和 ***edit*** 操作使用才有效。

* ***--config-file=[FILE]***

  指定一个命令所使用的配置文件径。该选项是可选的。不使用默认配置文件时，使用该选项。

* ***--domain=[DOMAIN]***

  指定要进行操作的域。对于 *add* 、 *edit* 和 *delete* 操作 --domain 是必须指定的。

* ***--force***

  强制命令执行，跳过删除的确认操作。

* ***--ldap-server=[servers]***

  为域设置的以逗号分隔的 LDAP 服务器列表。

* ***--provider=[PROVIDER]***

  指定目录服务的类型，支持的目录服务有：

    * ***ActiveDirectory*** - Microsoft Active Directory。

    * ***IPA*** - Identity Management（IdM）。

    * ***RHDS*** - Red Hat Directory Service。RHDS 不使用 Kerberos，而 EayunOS 虚拟化环境要求使用 Kerberos，因此使用 RHDS 时需要配置 Kerberos 域中的一个目录服务。

    >**注意**

    > 使用 RHDS 时必须安装 ***memberof*** 插件，使用 ***memeberof*** 插件要求用户都是 ***inetuser*** 用户。

    * ***itds*** - IBM Tivoli Directory Server。

    * ***oldap*** - OpenLDAP。

* ***--report***

  该选项和 ***validate*** 操作一起使用时，会生成在验证过程发生的所有错误信息的报告。

* ***--user=[USER]***

  指定目录服务的用户。在 ***add*** 操作中 ***--user*** 选项是必需的，***edit*** 操作则可以不会指定。

* ***--password-file=[FILE]***

  指定密码文件，目录服务用户的密码在该文件的第一行。执行 ***add*** 操作时，***--password-file*** 或者 ***--interactive*** 选项必须使用其中一个。

* ***--interactive***

  指定域用户的密码是否手动（交互式）地提供。在*add*操作中，该选项和 ***--password-file*** 必须选择其中一个使用。

**engine-manage-domains**使用方法的完整说明也可以通过下面的命令获取：

```
# engine-manage-domains --help
```
