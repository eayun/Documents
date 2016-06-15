# EayunOS 中对目录服务的支持情况

在安装过程中，EayunOS 虚拟化管理中心创建其自己内部的管理员用户
**admin**。这个账户是为了初始化配置环境以及排解疑难问题而设计的。要添加用户到
EayunOS 环境中，您需要使用 EayunOS 的域管理工具 **engine-manage-domains**
来连接一个目录服务器到虚拟化管理中心

一旦至少一个目录服务器连接至虚拟化管理中心，您就可以使用管理员门户来添加该目录服务器中已存在的用户并为他们指派角色。用户以格式为
**user@domain** 的用户主体名称（User Principal
Name，UPN）来区分。连接多个目录服务器到虚拟化管理中心同样被支持。

EayunOS 支持如下的目录服务器：

-   Active Directory

-   Identity Management(IdM)

-   Red Hat Directory Server 9 (RHDS 9)

-   OpenLDAP

您还必须确保您的目录服务器有正确的 DNS
记录，尤其是必须确保有以下几条关于您的目录服务器的 DNS 记录：

-   一个有效的目录服务器的反向地址查找指标记录（PTR）。

-   一个有效的在 TCP 389 端口上的 LDAP 服务定位器（SRV）。

-   一个有效的在 TCP 88 端口上的 Kerberos 服务定位器（SRV）。

-   一个有效的在 UDP 88 端口上的 Kerberos 服务定位器（SRV）。

如果以上记录在 DNS 中不存在，您将不能够使用 **engine-manage-domains**
来添加域至 EayunOS 虚拟化管理中心中。

关于安装和配置支持的目录服务器的更多详细信息，请参考各厂商的文档：

-   Active Directory -
    [http://technet.microsoft.com/en-us/windowsserver/dd448614](http://technet.microsoft.com/en-us/windowsserver/dd448614)

-   Identity Management (IdM) -
    [http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Identity_Management_Guide/index.html](http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Identity_Management_Guide/index.html)

-   Red Hat Directory Server (RHDS) -
    [http://docs.redhat.com/docs/en-US/Red_Hat_Directory_Server/index.html](http://docs.redhat.com/docs/en-US/Red_Hat_Directory_Server/index.html)

-   OpenLDAP - [http://www.openldap.org/doc/](http://www.openldap.org/doc/)

> **重要**
>
> 您必须明确地在目录服务器中创建一个新用户作为
> 虚拟化环境的管理用户。但是**不要**使用目录服务器的管理用户作为
> 虚拟化环境的管理用户。

</br>

> **重要**
>
> 同一个系统上无法同时安装 EayunOS 虚拟化管理中心和 IdM(ipa-server)。IdM 与
> EayunOS 虚拟化管中心所依赖的 mod\_ssl 包不兼容。

</br>


> **重要**
>
> 如果您使用 Active Directory
> 作为目录服务器，并且您希望在创建模板和虚拟机的过程中使用
> *sysprep*，EayunOS 管理员用户必须被授权对域进行的操作包括：
>
> -   将一台计算机加入域
>
> -   修改域中组的成员
>
> 关于在 Active Directory
> 中创建用户账户的信息，请参考[http://technet.microsoft.com/en-us/library/cc732336.aspx](http://technet.microsoft.com/en-us/library/cc732336.aspx)。
>
> 关于在 Active Directory
> 中进行操作授权，请参考[http://technet.microsoft.com/en-us/library/cc732524.aspx](http://technet.microsoft.com/en-us/library/cc732524.aspx)。

</br>


> **注意**
>
> EayunOS 虚拟化管理中心 使用 Kerberos 来与目录服务器进行认证。RHDS
> 并不提供原生的 Kerberos 支持。如果您使用 RHDS
> 作为目录服务器则您必须确保该目录服务器是作为一个有效的 Kerberos
> 域中的服务存在。要实现这个目标，您必须在参考相关的目录服务器文档的同时进行如下操作：
>
> -   为 RHDS 配置 **memberOf** 插件以允许组成员。尤其是要注意确保
>     **memberOf** 插件中的 **memberofgroupattr** 属性的值应该设置为
>     **uniqueMember**。在 **OpenLDAP** 中，**memberOf**
>     功能不被称作“插件”，而被称作“overlay”，并且不要求安装后进行任何配置。
>
>     参考 RHDS 9.0 插件指南获得关于更多配置 **memberOf** 插件的信息。
>
> -   在 Kerberos 域中将目录服务器以格式 **ldap/hostname@REALMNAME**
>     定义为服务。将 **hostname** 替换为目录服务器的完全合格域名，将
>     **REALMNAME** 替换为 Kerberos realm 的完全合格域名。Kerberos 的
>     realm 名称必须全部大写。
>
> -   在 Kerberos 域中为目录服务器生成一个 `keytab` 文件。该 `keytab`
>     文件包含 Kerberos 的 principal 与其对应的加密的 key 对。这些 key
>     将允许目录服务向 Kerberos 域认证其本身，
>
>     参考您的 Kerberos 的文档获得更多关于如何生成 `keytab` 文件的信息。
>
> -   将 `keytab` 文件安装到目录服务器。然后配置 RHDS 使其识别该
>     `keytab` 文件并接受使用 GSSAPI 的 Kerberos 认证。
>
>     参考 RHDS 9.0 系统管理员手册获得更多关于配置 RHDS 使用外部的
>     `keytab` 文件的信息。
>
> -   通过在目录服务器上使用 `kinit` 命令认证一个在 Kerberos
>     realm 中定义的用户来对配置进行测试。一旦认证成功，则对目录服务器执行
>     `ldapsearch` 命令。使用 `-Y GSSAPI` 确保使用 Kerberos 进行认证。
>

> **配置通用的 LDAP 供应商**

> 可以配置一个通用的 LDAP 供应商来提供用户验证和授权服务。这个新功能使用 LDAP 协议访问 LDAP 服务器，并可以对它进行自定义。要配置一个通用的 LDAP 供应商，需要修改身份验证扩展的配置文件、两个扩展值向的 LDAP 配置文件。

> -   1. 在 EayunOS Manager 中安装 LDAP 扩展软件包：

>     ```# yum install ovirt-engine-extension-aaa-ldap```

> -   2. 把 LDAP 配置模板文件复制到 /etc/ovirt-engine 目录中。其中包括了 Active Directory（ad）和其它目录服务类型（simple）的模板文件。这个示例使用简单配置模板。

>     ```# cp -r /usr/share/ovirt-engine-extension-aaa-ldap/examples/simple/. /etc/ovirt-engine```

> -   3. 编辑 LDAP 属性配置文件，取消注释一个 LDAP 服务器类型并更新域和密码项的内容。

>     ```#  vi /etc/ovirt-engine/aaa/profile1.properties```

> **配置档案实例：LDAP 服务器部分**

>        # Select one
>        include = <openldap.properties>
>        #include = <389ds.properties>
>        #include = <rhds.properties>
>        #include = <ipa.properties>
>        #include = <iplanet.properties>
>        #include = <rfc2307.properties>
>        # Server
>        vars.server = ldap1.company.com`
>        # Search user and its password.
>        vars.user = uid=search,cn=users,cn=accounts,dc=company,dc=com
>        vars.password = 123456
>        pool.default.serverset.single.server = ${global:vars.server}
>        pool.default.auth.simple.bindDN = ${global:vars.user}
>        pool.default.auth.simple.password = ${global:vars.password}

>    为了使用 TLS 或 SSL 协议来与 LDAP 服务器进行交流，获得 LDAP 服务器的根（root）CA 证书，使用它来创建一个公共的 keystore 文件。取消注释以下行，指定到公共 keystore 文件的完全路径以及访问这个文件的密码。

> **配置档案实例：keystore 部分**

>        # Create keystore, import certificate chain and uncomment
>        # if using tls.```
>        pool.default.ssl.startTLS = true
>        pool.default.ssl.truststore.file = /full/path/to/myrootca.jks
>        pool.default.ssl.truststore.password = changeit

>    4. 检查验证配置文件。profile 名在管理门户和用户门户的登录界面中可见。配置 profile 的位置必须和 LDAP 配置文件的位置相匹配。所有项都可以使用默认值。

>        # vi /etc/ovirt-engine/extensions.d/profile1-authn.properties

> **验证配置文件的示例**

>        ovirt.engine.extension.name = profile1-authn
>        ovirt.engine.extension.bindings.method = jbossmodule
>        ovirt.engine.extension.binding.jbossmodule.module = org.ovirt.engine-extensions.aaa.ldap
>        ovirt.engine.extension.binding.jbossmodule.class = org.ovirt.engineextensions.aaa.ldap.AuthnExtension
>        ovirt.engine.extension.provides = org.ovirt.engine.api.extensions.aaa.Authn
>        ovirt.engine.aaa.authn.profile.name = profile1
>        ovirt.engine.aaa.authn.authz.plugin = profile1-authz
>        config.profile.file.1 = ../aaa/profile1.properties

>    5. 检查授权配置文件。这个配置集的配置必须和 LDAP 配置文件的位置相匹配。所有项都可以使用默认值。

>        # vi /etc/ovirt-engine/extensions.d/profile1-authz.properties

> **授权配置文件的示例**

>        ovirt.engine.extension.name = profile1-authz
>        ovirt.engine.extension.bindings.method = jbossmodule
>        ovirt.engine.extension.binding.jbossmodule.module = org.ovirt.engine-extensions.aaa.ldap
>        ovirt.engine.extension.binding.jbossmodule.class = org.ovirt.engineextensions.aaa.ldap.AuthzExtension
>        ovirt.engine.extension.provides = org.ovirt.engine.api.extensions.aaa.Authz
>        config.profile.file.1 = ../aaa/profile1.properties

>    6. 为配置文件设置正确的所有者权限和访问权限：

>        # chown ovirt:ovirt /etc/ovirt-engine/aaa/profile1.properties
>        # chmod 600 /etc/ovirt-engine/aaa/profile1.properties

>    7. 重新启动引擎服务。

>        # service ovirt-engine restart

>    8. 在管理门户和用户门户的登录页中包括了刚创建的 ldap1 profile。如需了解更多与为 LDAP 服务器中的用户分配相关权限（如登录到用户门户的权限）的信息，请参阅 Red Hat Enterprise Virtualization Administration Guide 的 Red Hat Enterprise Virtualization Manager User Tasks 一节。

>    **注意**

>      如需了解更多信息，请参阅 LDAP 验证和授权扩展的 README 文件（/usr/share/doc/ovirt-engine-extension-aaa-ldap-version）。


> **管理门户和用户门户的单点登录**

> EayunOS4.2 以及更高的版本支持到管理门户和用户门户的单点登录功能。在启用这个功能时，用户可以使用从单点登录机制（如 Kerberos）所获得的凭证登录到用户门户或管理门户。管理员需要设定使用哪一种单点登录机制。

> 如需了解使用 Kerberos 实现管理门户和用户门户的单点登录功能的信息，请参阅 第 13.2.3.1 节 “为 LDAP 和 Kerberos 配置单点登录”。.

> **注意**

> 如果到用户门户的单独登录功能被启用，则到虚拟机的单点登录功能将无法实现。这是因为，用户门户在启用了单独登录功能后，将不需要接受用户密码，因此用户的密码将无法在登录到虚拟机时被验证。

> 为 LDAP 和 Kerberos 配置单点登录

> 这个示例假设了以下情况：

> -   存在的 KDC（Key Distribution Center，密钥分配中心）服务器使用 MIT 版的 Kerberos 5。

> -   您具有 KDC 服务器的管理权限。

> -   EayunOS Manager 和用户的机器上安装了 Kerberos 客户端

> -   kadmin 工具程序可以被用来创建 Kerberos 服务主体（principal）和 keytab 文件。

> 这个过程会涉及到以下组件：

> 在 KDC 服务器上

> -   为 EayunOS Manager 上的 Apache 服务创建一个服务主体（principal）和一个 keytab 文件。

> -   在 EayunOS Manager 上

> 在 EayunOS Manager 上

> -   安装 Manager 的验证和授权扩展软件包，以及 Apache Kerberos 验证模块。

> -   配置扩展文件

> **过程 13.2. 为 Apache 服务配置 Kerberos**

>    1. 在 KDC 服务器上，使用 kadmin 为 EayunOS Manager 上的 Apache 服务创建一个服务主体。这个服务主体是 KDC 指代 Apache 服务的 ID。

>        kadmin
>        kadmin> addprinc -randkey HTTP/fqdn-of-rhevm@REALM.COM

>    2. 为 Apache 服务产生一个 keytab 文件。keytab 文件保存了共享的密钥。

>        kadmin> ktadd -k /tmp/http.keytab HTTP/fqdn-of-rhevm@REALM.COM
>        kadmin> quit

>    3. 把 keytab 文件从 KDC 服务器复制到 EayunOS Manager：
>        scp /tmp/http.keytab root@rhevm.example.com:/etc/httpd

> **配置到用户门户和管理门户的单点登录**

>    1. 在 EayunOS Manager 上，设置正确的 keytab 所有者权限和访问权限：

>        chown apache /etc/httpd/http.keytab

>        chmod 400 /etc/httpd/http.keytab

>    2. 安装验证扩展软件包、LDAP 扩展软件包和 mod_auth_kerb 验证模块：

>        yum install ovirt-engine-extension-aaa-misc ovirt-engine-extension-aaa-ldap mod_auth_kerb

>    3. 把 SSO 配置模板文件复制到 /etc/ovirt-engine 目录中。其中包括了 Active Directory（ad-sso）和其它目录服务类型（simple-sso）的模板文件。这个示例使用简单 SSO 配置模板

>        cp -r /usr/share/ovirt-engine-extension-aaa-ldap/examples/simple-sso/. /etc/ovirt-engine

>    4. 为 Apache 创建一个 /etc/httpd/conf.d 目录的软链接来使用 SSO 配置文件：

>        ln -s /etc/ovirt-engine/aaa/ovirt-sso.conf /etc/httpd/conf.d

>    5. 编辑验证方法文件来使 Apache 使用 Kerberos 进行验证：

>        vi /etc/ovirt-engine/aaa/ovirt-sso.conf

>    **验证方法文件的示例**

>    <LocationMatch ^(/ovirt-engine/(webadmin|userportal|api)|/api)>
>        ```RewriteEngine on```
>        ```RewriteCond %{LA-U:REMOTE_USER} ^(.*)$```
>        ```RewriteRule ^(.*)$ - [L,P,E=REMOTE_USER:%1]```
>        ```RequestHeader set X-Remote-User %{REMOTE_USER}s```
>        ```AuthType Kerberos```
>        ```AuthName "Kerberos Login"```
>        ```Krb5Keytab /etc/httpd/http.keytab```
>        ```KrbAuthRealms REALM.COM```
>        ```Require valid-user```
>    ```</LocationMatch>```

>    6. 编辑 LDAP 属性配置文件，取消注释一个 LDAP 服务器类型并更新域和密码项的内容：

>        vi /etc/ovirt-engine/aaa/profile1.properties

> **配置档案实例：LDAP 服务器部分**

>        # Select one
>        include = <openldap.properties>
>        #include = <389ds.properties>
>        #include = <rhds.properties>
>        #include = <ipa.properties>
>        #include = <iplanet.properties>
>        #include = <rfc2307.properties>
>        # Server
>        vars.server = ldap1.company.com
>        # Search user and its password.
>        vars.user = uid=search,cn=users,cn=accounts,dc=company,dc=com
>        vars.password = 123456
>        pool.default.serverset.single.server = ${global:vars.server}
>        pool.default.auth.simple.bindDN = ${global:vars.user}
>        pool.default.auth.simple.password = ${global:vars.password}

>    为了使用 TLS 或 SSL 协议来与 LDAP 服务器进行交流，获得 LDAP 服务器的根（root）CA 证书，使用它来创建一个公共的 keystore 文件。取消注释以下行，指定到公共 keystore 文件的完全路径以及访问这个文件的密码。

>    **注意**

>      如需了解更多与创建公共 keystore 文件相关的信息，请参阅 第 C.2 节 “在 Manager 和一个 LDAP 服务器间设置 SSL 或 TLS 连接”。

> **配置档案实例：keystore 部分**

>        # Create keystore, import certificate chain and uncomment
>        # if using ssl/tls.
>        pool.default.ssl.startTLS = true
>        pool.default.ssl.truststore.file = /full/path/to/myrootca.jks
>        pool.default.ssl.truststore.password = changeit

>    7. 检查验证配置文件。profile 名在管理门户和用户门户的登录界面中可见。配置 profile 的位置必须和 LDAP 配置文件的位置相匹配。所有项都可以使用默认值。

>        vi /etc/ovirt-engine/extensions.d/profile1-http-authn.properties

> **验证配置文件的示例**

>        ovirt.engine.extension.name = profile1-authn
>        ovirt.engine.extension.bindings.method = jbossmodule
>        ovirt.engine.extension.binding.jbossmodule.module = org.ovirt.engine-extensions.aaa.ldap
>        ovirt.engine.extension.binding.jbossmodule.class = org.ovirt.engineextensions.aaa.ldap.AuthnExtension
>        ovirt.engine.extension.provides = org.ovirt.engine.api.extensions.aaa.Authn
>        ovirt.engine.aaa.authn.profile.name = profile1-http
>        ovirt.engine.aaa.authn.authz.plugin = profile1-authz
>        ovirt.engine.aaa.authn.mapping.plugin = http-mapping
>        config.artifact.name = HEADER
>        config.artifact.arg = X-Remote-User


>    8. 检查授权配置文件。这个配置集的配置必须和 LDAP 配置文件的位置相匹配。所有项都可以使用默认值。

>        vi /etc/ovirt-engine/extensions.d/profile1-authz.properties

> **授权配置文件的示例 **

>        ovirt.engine.extension.name = profile1-authz
>        ovirt.engine.extension.bindings.method = jbossmodule
>        ovirt.engine.extension.binding.jbossmodule.module = org.ovirt.engine-extensions.aaa.ldap
>        ovirt.engine.extension.binding.jbossmodule.class = org.ovirt.engineextensions.aaa.ldap.AuthzExtension
>        ovirt.engine.extension.provides = org.ovirt.engine.api.extensions.aaa.Authz
>        config.profile.file.1 = ../aaa/profile1.properties

>    9. 为配置文件设置正确的所有者权限和访问权限：

>        chown ovirt:ovirt /etc/ovirt-engine/aaa/profile1.properties
>        chmod 600 /etc/ovirt-engine/aaa/profile1.properties

>    10. 重启 Apache 服务和引擎服务：

>        service httpd restart
>        service ovirt-engine restart

























































