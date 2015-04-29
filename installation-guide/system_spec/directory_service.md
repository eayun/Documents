# 目录服务

1. 目录服务简介

   目录服务是指提供储存企业和用户信息数据，并提供给用户的软硬件和处理流程的集合。一个目录服务至少包含一个目录服务器和一个目 录客户端。客户端可以访问目录服务中储存的各种数据信息，如姓名、电话号码等。

2. EayunOS 虚拟化环境对目录服务的支持

   安装 EayunOS 虚拟化宿主机时自动建立了一个管理用户admin，该用户只用于整个虚拟化环境的初始配置和故障处理。要增加其他用户，必须通过管理门户中的【Domain】连接到一个目录服务。

   当 EayunOS 虚拟化管理中心连接到至少一个目录服务之后，才可以通过管理门户添加目录服务中已有的用户，并为新增的用户赋予不同的角色和权限。用户通过user@domain这种格式的UPN（User Principal Name） 进行唯一标识。 EayunOS 虚拟化管理中心支持同时连接到多个目录服务。

   目前 EayunOS 虚拟化管理中心支持的目录服务器有：

   * Active Directory
   * Identity Management (IdM)
   * Red Hat Directory Server 9 (RHDS 9)
   * OpenLDAP

   目录服务器必须有正确的DNS记录，包括：

   * 目录服务器的PTR记录
   * LDAP TCP 389端口的SRV记录
   * Kerberos TCP 88端口的SRV记录
   * Kerberos UDP 88端口的SRV记录

   如果 EayunOS 虚拟化管理中心无法解析上述DNS记录，【Domain】工具无法添加目录服务。

   关于各目录服务器的详细文档，请查阅厂商或者社区网站：

   * [Active Directory](http://technet.microsoft.com/en-us/windowsserver/dd448614)
   * [Identity Management (IdM)](http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Identity_Management_Guide/index.html)
   * [Red Hat Directory Server 9 (RHDS 9)](http://docs.redhat.com/docs/en-US/Red_Hat_Directory_Server/index.html)
   * [LDAP](http://www.openldap.org/doc/)

   > **重要**
   >
   > 在目录服务中必须建立一个用户作为 EayunOS 虚拟化管理中心的管理员用户，不要直接使用目录服务的管理员用户作为 EayunOS 虚拟化管理中心的管理员。

<br/>
   > **重要**
   >
   > dM（ipa-server）无法和 EayunOS 虚拟化管理中心安装在同一台服务器上，因为IdM和mod_ssl不兼容，但是该软件包是安装 EayunOS 虚拟化管理中心必需的。

<br/>
   > **重要**
   >
   > 如果使用 Active Directory 作为目录服务，而且在建立模板和虚拟机时需要使用 sysprep，那么 EayunOS 虚拟化管理中心的管理员用户必须用户 AD 域的以下权限：
   > * Join a computer to the domain
   > * Modify the m em bership of a group
   > 关于 Active Direcotry 建立用户和赋予权限的详细说明参见：
   > * [建立用户](http://technet.microsoft.com/en-us/library/cc732336.aspx)
   > * [赋予权限](http://technet.microsoft.com/en-us/library/cc732524.aspx)

<br/>
   > **注意**
   >
   > EayunOS 虚拟化管理中心访问目录服务时使用 Kerberos 验证。RHDS 不能直接支持 Kerberos。使用 RHDS 时需要保证它作为一个可用的 Kerberos 域中目录服务，通过以下步骤可以实现这一部署方案，详细说明请查阅厂商文档：
   > * 配置 RHDS 的 memberOf 插件以支持用户分组。
   > * 将目录服务配置为 Kerberos realm 中一个服务，服务名称的格式为 ldap/hostname@REALNAME，其中 hostname 是目录服务器的完整域名，REALNAME 是 Kerberos realm 的完整名称。
   > * 在 Kerberos realm 中为目录服务生成一个 keytab 文件。
   > * 在目录服务器上安装 keytab 文件，并配置 RHDS 使用 keytab 文件而且接受使用 GSSAPI 进行 Kerberos 验证。
   > * 在目录服务器上使用 kinit 测试用户验证是否可以通过。验证通过之后，使用 ldapsearch 加上【-Y】GSSAPI 参数测试是否可以正常查询目录服务。
