# EayunOS系统需求

* [ 系统需求之流程图解 ](#系统需求之流程图解)

* [ 硬件需求 ](#硬件需求)
  * [ EayunOS硬件需求概览 ](#EayunOS硬件需求概览)
  * [ EayunOS虚拟化管理中心的硬件需求 ](#EayunOS虚拟化管理中心的硬件需求)
  * [ EayunOS虚拟化宿主机的硬件需求 ](#EayunOS虚拟化宿主机的硬件需求)

* [ 软件需求 ](#软件需求)
  * [ EayunOS虚拟化管理中心客户端的软件要求 ](#EayunOS虚拟化管理中心客户端的软件要求)
  * [ 目录服务 ](#目录服务)
  * [ 防火墙配置 ](#防火墙配置)
  * [ 用户和用户组的要求 ](#用户和用户组的要求)

## 系统需求之流程图解

  （图 系统需求）

## 硬件需求
### EayunOS硬件需求概览

  部署EayunOS虚拟化环境，最少应该满足以下设备要求：

  * 1台EayunOS虚拟化管理中心服务器，
  * 1台及以上的EayunOS虚拟化宿主机服务器（为了支持虚拟机迁移 以及电源管理，则最少应该准备2台EayunOS虚拟化宿主机服务器），
  * 1台及以上用于访问管理门户的客户端设备，
  * 存储设备（NFS、POSIX文件系统、iSCSI存储、SAN存储或者服务器本地存储设备）。

  上述几种类型的硬件需求在后面的章节中会详细说明。

> ##### 参见
> EayunOS虚拟化管理中心的硬件需求
>
> EayunOS虚拟化宿主机的硬件需求

### EayunOS虚拟化管理中心的硬件需求（需要修改）

  这里提供的最小和推荐硬件需求均针对典型部署方案而言，实际部署时请根据系统规模和负载情况考虑硬件配置。

  * 最小硬件需求：
    * 1颗双核CPU。
    * 系统（部署EayunOS虚拟化管理中心之前）正常运行时可以保留4G空闲内存。
    * 25G空闲磁盘空间。
    * 1块千兆（或者更高速率）网卡。

  * 建议硬件需求
    * 1颗及以上双核CPU。
    * 16G内存。
    * 50G本地空闲磁盘空间。
    * 1块千兆（或者更高速率）网卡。

### EayunOS虚拟化宿主机的硬件需求
1. EayunOS虚拟化宿主机对于CPU的要求

  EayunOS虚拟化宿主机支持以下型号的CPU：

  * AMD Operton G1
  * AMD Operton G2
  * AMD Operton G3
  * AMD Operton G4
  * AMD Operton G5
  * Intel Conroe
  * Intel Penryn
  * Intel Nehalem
  * Intel Westmere
  * Intel Sandybridge
  * Intel Haswell

  CPU必须支持64位技术（Intel® 64 or AMD64），支持 AMD-V™或者Intel VT®虚拟化技术。另外CPU也必须支持NX技术（No eXecute）。部署之前需要检查CPU是否满足上述要求：

  1. 使用EayunOS虚拟化宿主机安装光盘引导服务器，进入救援模 式（rescue）。
  1. 出现提示符，执行命令：`# grep -E 'svm|vmx' /proc/cpuinfo | grep nx`。

    如果有输出，说明CPU支持虚拟化技术。某些服务器的BIOS中提供了禁用虚拟化技术的选项，需要根据硬件手册确认或者咨询生产厂商。

  1. 检查内核模块kvm有没有加载：`# lsmod | grep kvm`。

    如果输出中包含kvm_intel或者kvm_amd说明模块已经正确加载，CPU满足虚拟化技术的要求。

1. EayunOS虚拟化宿主机对于系统内存的要求

  建议EayunOS虚拟化宿主机服务器配置2G以上的内存。以下因素对实际内存的需求产生影响：

  * 虚拟机操作系统对内存的使用；
  * 虚拟机中运行的应用程序对内存的使用；
  * 虚拟机本身对内存的使用。

  KVM使用了内存over-commit技术改善了对虚拟机内存申请的管理，允许在所有虚拟机不是都处于高负载的情况下满足一些虚拟机申请超过物理限制数量的内存。

  目前EayunOS虚拟化宿主机支持最大2T内存。

1. EayunOS虚拟化宿主机对于存储空间的要求

  建议EayunOS虚拟化宿主机至少应该配置2G存储空间，包括：

  * 根分区至少需要500M；
  * 配置文件分区至少需要8M；
  * 日志分区建议至少使用2048M；
  * 数据分区至少使用256M。数据分区过小会导致后期无法进行扩展或者更新。默认情况下，其他分区划分完成之后，所有空闲的存储空间都会分配给数据分区。
  * swap分区至少需要8M。swap分区的推荐大小由服务器的配置，以及内存overcommit的配置决定。EayunOS虚拟化宿主机中内存overcommit默认的比例为0.5。

    可以通过下面的 公式确定swap分区的大小：

    * 将物理内存总量乘以overcommit比例，加上
    * 2G（如果系统内存小于等于4G），或者
    * 4G（如果系统内存大于4G小于16G），或者
    * 8G（如果系统内存大于16G小于64G），或者
    * 16G（如果系统内存大于64G小于256G），或者

    > ##### 示例：计算swap分区大小
    > 对于配置了8G物理内存的服务器来 说，使用上面的说明可以计算得出：
    > 
    > (8 GB x 0.5) + 4 GB = 8 GB

> #### 重要
> EayunOS虚拟化宿主机安装时会自动使用上述公式计算swap分区大小，内存overcommit比例为0.5。某些情况下，计算得出的swap分区大小 超过了本地磁盘的剩余空间，导致EayunOS虚拟化宿主机安装失败。此时可以通过storage_vol引导参数手动设置分区大小。
> > ##### 示例：手动设置swap分区大小
> > 下面的示例，只设置swap分区大小 为4096M，没有设置其他分区的大 小，由安装程序自行确定。
> > storage_vol=:4096::::

> #### 重要
> EayunOS虚拟化宿主机不支持安装在fakeraid设备上。使用fakeraid设备时必须重新配置为non-RAID的模式。
> * 进入RAID控制器的BIOS，删除所 有LUN。
> * 将控制器设置为non-RAID模式（“compatibility”或者“JBOD” 选项，具体需要资源硬件厂商）。
> 具体的配置方法和说明请咨询硬件厂商。

1. EayunOS虚拟化宿主机对于PCI设备的要求

  EayunOS虚拟化宿主机至少应该配置1块千兆（或者更高速率）网卡，建议配 置2块网卡以支持对网络要求较高的任务，如虚拟机迁移等。

## 软件需求
### EayunOS虚拟化管理中心客户端的软件要求

  客户端通过web浏览器访问管理门户和普通用户门户。不同的操作系统平台上对web浏览器有不同的要求：

  * 在Red Hat企业Linux上，使用Mozilla Firefox 17或者更新版本可以访问2种门户；
  * 在微软Windows上，使用IE 8或者更新版本可以访问普通用户门户（只支持桌面版IE，不可使用触屏版的IE 10）。
  * 在微软Windows上，使用IE 9或者更新版本可以访问管理门户（只支持桌面版IE，不可使用触屏版的IE 10）。

  使用虚拟机控制台，需要安装SPICE客户端。支持安装SPICE客户端的系统有：

  * Red Hat企业Linux 5.8+（i386、amd64、Intel64）
  * Windows XP
  * Windows XP Embedded (XPe)
  * Windows 7 (x86, AMD64 and Intel 64)
  * Windows 8 (x86, AMD64 and Intel 64)
  * Windows Embedded Standard 7
  * Windows 2008/R2 (x86, AMD64 and Intel 64)
  * Windows Embedded Standard 2009

  Mozilla Firefox使用的SPICE客户端，需要通过yum安装spice-xpi。

  使用IE访问2种门户时，SPICE ActiveX插件会自动下载安装。

### 目录服务
1. 目录服务简介

  目录服务是指提供储存企业和用户信息数据，并提供给用户的软硬件和处理流程的集合。一个目录服务至少包含一个目录服务器和一个目 录客户端。客户端可以访问目录服务中储存的各种数据信息，如姓名、电话号码等。

* 参见

  【】

1. EayunOS虚拟化环境对目录服务的支持

  安装EayunOS虚拟化宿主机时自动建立了一个管理用户admin，该用户只用于整个虚拟化环境的初始配置和故障处理。要增加其他用户，必须通过管理门户中的【Domain】连接到一个目录服务。

  当EayunOS虚拟化管理中心连接到至少一个目录服务之后，才可以通过管理门户添加目录服务中已有的用户，并为新增的用户赋予不同的角色和权限。用户通过user@domain这种格式的UPN（User Principal Name） 进行唯一标识。EayunOS虚拟化管理中心支持同时连接到多个目录服务。

  目前EayunOS虚拟化管理中心支持的目录服务器有：

  * Active Directory
  * Identity Management (IdM)
  * Red Hat Directory Server 9 (RHDS 9)
  * OpenLDAP

  目录服务器必须有正确的DNS记录，包括：

  * 目录服务器的PTR记录
  * LDAP TCP 389端口的SRV记录
  * Kerberos TCP 88端口的SRV记录
  * Kerberos UDP 88端口的SRV记录

  如果EayunOS虚拟化管理中心无法解析上述DNS记录，【Domain】工具无法添加目录服务。

  关于各目录服务器的详细文档，请查阅厂商或者社区网站：

  * [Active Directory](http://technet.microsoft.com/en-us/windowsserver/dd448614)
  * [Identity Management (IdM)](http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Identity_Management_Guide/index.html)
  * [Red Hat Directory Server 9 (RHDS 9)](http://docs.redhat.com/docs/en-US/Red_Hat_Directory_Server/index.html)
  * [LDAP](http://www.openldap.org/doc/)

> #### 重要
> 在目录服务中必须建立一个用户作为EayunOS虚拟化管理中心的管理员用户，不要直接使用目录服务的管理员用户作为EayunOS虚拟化管理中心的管理员。

> #### 重要
> dM（ipa-server）无法和EayunOS虚拟化管理中心安装在同一台服务器上，因为IdM和mod_ssl不兼容，但是该软件包是安装EayunOS虚拟化管理中心必需的。

> #### 重要
> 如果使用Active Directory作为目录服务，而且在建立模板和虚拟机时需要使用sysprep，那么EayunOS虚拟化管理中心的管理员用户必须用户AD域的以下权限：
> * Join a computer to the domain
> * Modify the m em bership of a group
> 关于Active Direcotry建立用户和赋予权限的详细说明参见：
> * [建立用户](http://technet.microsoft.com/en-us/library/cc732336.aspx)
> * [赋予权限](http://technet.microsoft.com/en-us/library/cc732524.aspx)

> #### 注意
> EayunOS虚拟化管理中心访问目录服务时使用Kerberos验证。RHDS不能直接支持Kerberos。使用RHDS时需要保证它作为一个可用的Kerberos域中目录服务，通过以下步骤可以实现这一部署方案，详细说明请查阅厂商文档：
> * 配置RHDS的memberOf插件以支持用户分组。
> * 将目录服务配置为Kerberos realm中一个服务，服务名称的格式为ldap/hostname@REALNAME，其中hostname是目录服务器的完整域名，REALNAME是Kerberos realm的完整名称。
> * 在Kerberos realm中为目录服务生成一个keytab文件。
> * 在目录服务器上安装keytab文件，并配置RHDS使用keytab文件而且接受使用GSSAPI进行Kerberos验证。
> * 在目录服务器上使用kinit测试用户验证是否可以通过。验证通过之后，使用ldapsearch加上【-Y】GSSAPI参数测试是否可以正常查询目录服务。

* 参见
  * 

### 防火墙配置
1. EayunOS虚拟化管理中心的防火墙配置

  EayunOS虚拟化管理中心使用的网络端口需要在防火墙中允许通过才能正常提供服务。EayunOS Appliance创建EayunOS虚拟化管理中心虚拟机时会自动配置防火墙，系统已有的防火墙配置会被覆盖。

  安装EayunOS虚拟化管理中心之前自行定义的防火墙规则需要手动添加到配置文件中。？？

  下面的防火墙配置表格，适用于使用默认配置安装的情况。如果安装时选择了其他的HTTP或者HTTPS端口，请根据实际情况修改。

> ##### 表：EayunOS虚拟化管理中心的防火墙配置

  |  端口  |  协议  |      来源地址    |    目的地址    |    用途    |
  |--------|--------|------------------|----------------|------------|
  |        |ICMP    |<ul><li>EayunOS虚拟化宿主机</li><li>其他独立主机</li></ul>|<ul><li>EayunOS虚拟化管理中心</li></ul>|EayunOS虚拟化宿主机向EayunOS虚拟化管理中心注册 时，通过ICMP请求确认EayunOS虚拟化管理中心是否在线。|
  |22      |TCP     |<ul><li>需要对EayunOS虚拟化管理中心进行维护管理的系统</li></ul>|<ul><li>EayunOS虚拟化管理中心</li></ul>|SSH（可选）|
  |80, 443 |TCP     |<ul><li>管理门户客户端</li><li>普通用户门户客户端</li><li>EayunOS虚拟化宿主机</li><li>其他独立主机</li><li>REST API客户端</li></ul>|<ul><li>EayunOS虚拟化管理中心</li></ul>|通过HTTP或者HTTPS访问EayunOS虚拟化管理中心|

> #### 重要
> 当EayunOS虚拟化管理中心服务器还需要提供NFS服务，如ISO存储域，则还需要在防火墙配置增加一些端口：
> * NFSv4
>   * 2049端口（TCP）
> * NFSv3
>   * 2049端口（TCP和UDP）
>   * 111端口（TCP和UDP，rpcbind/sunrpc服务）
>   * 通过MOUNTD_PORT指定的端口（TCP和UDP）
>   * 通过STATD_PORT指定的端口（TCP和UDP）
>   * 通过LOCKD_TCPPORT指定的端口（TCP）
>   * 通过LOCKD_UDPPORT指定的端口（UDP）
> MOUNTD_PORT、STATD_PORT、LOCKD_TCPPORT和LOCKD_UDPPORT在`/etc/sysconfig/nfs`中配置。

1. EayunOS虚拟化宿主机的防火墙配置

  使用EayunOS虚拟化宿主机光盘安装时会自动配置防火墙。将普通的Linux主机加入EayunOS虚拟化环境时需要手动配置防火墙。

> ##### 表：EayunOS虚拟化管理中心的防火墙配置

  |  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
  |--------|--------|----------------|----------------|------------|
  |22      |TCP     |<ul><li>EayunOS虚拟化管理中心</li></ul>|<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|SSH访问连接|
  |5900 - 6411|TCP     |<ul><li>访问管理门户的客户端</li><li>访问普通用户门户客户端</li></ul>|<li>EayunOS虚拟化宿主机</li></li>单独的Linux主机</li></ul>|客户端使用这些端口连接虚拟机的的VNC和SPICE接口。|
  |5989    |TCP，UDP|CIMOM           |<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|使用CIMOM监控虚拟机时需要使用该端口|
  |16514   |TCP     |<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|使用libvirt进行虚拟机迁移时需要 使用该端口|
  |49152 - 49216|TCP     |<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|虚拟机迁移以及VDSM的fencing|
  |54321   |TCP     |<ul><li>EayunOS虚拟化管理中心</li><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li>EayunOS虚拟化宿主机</li><li>单独的Linux主机</li></ul>|EayunOS虚拟化管理中心和虚拟化宿主机、虚拟化宿主机和虚拟化宿主机之间VDSM的通信。|

> ##### 示例：EayunOS虚拟化宿主机安装自动生成的防火墙配置

    *filter
           :INPUT ACCEPT [0:0]
           :FORWARD ACCEPT [0:0]
           :OUTPUT ACCEPT [0:0]
           -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
           -A INPUT -p icmp -j ACCEPT
           -A INPUT -i lo -j ACCEPT
           # vdsm
           -A INPUT -p tcp --dport 54321 -j ACCEPT
           # libvirt tls
           -A INPUT -p tcp --dport 16514 -j ACCEPT
           # SSH
           -A INPUT -p tcp --dport 22 -j ACCEPT
           # guest consoles
           -A INPUT -p tcp -m multiport --dports 5634:6166 -j ACCEPT
           # migration
           -A INPUT -p tcp -m multiport --dports 49152:49216 -j ACCEPT
           # snmp
           -A INPUT -p udp --dport 161 -j ACCEPT
           # Reject any other input traffic
           -A INPUT -j REJECT --reject-with icmp-host-prohibited
           -A FORWARD -m physdev ! --physdev-is-bridged -j REJECT --reject-with icmp-host-
           prohibited
           COMMIT

1. 目录服务的防火墙配置

  EayunOS虚拟化管理中心使用目录服务进行用户管理和验证，针对目录服务也需要对防火墙进行一些配置。

> ##### 表：目录服务的防火墙配置

  |  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
  |--------|--------|----------------|----------------|------------|
  |88, 464 |TCP，UDP|<ul><li>EayunOS虚拟化管理中心</li></ul>|<ul><li>目录服务器</li></ul>|Kerberos验证|
  |389， 636|TCP     |<ul><li>EayunOS虚拟化管理中心</li></ul>|<ul><li>目录服务器</li></ul>|使用SSL加密的目录服务访问|

1. 数据库的防火墙配置

  EayunOS虚拟化管理中心可以使用远程数据库服务器，使用远程数据库服务器时需要考虑防火墙的配置。

> ##### 表：数据库的防火墙配置

  |  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
  |--------|--------|----------------|----------------|------------|
  |5432    |TCP，UDP|<ul><li>EayunOS虚拟化管理中心</li></ul>|<ul><li>数据库服务器</li></ul>|PostgreSQL数据库的默认监听端口|

### 用户和用户组的要求
1. EayunOS虚拟化管理中心上的系统用户

  EayunOS虚拟化管理中心安装时会自动建立以下用户：

  * vdsm用户，默认uid为36。挂载和访问NFS存储域时使用该用户。
  * ovirt用户，默认uid为108。管理门户的运行使用该用户。

1. EayunOS虚拟化管理中心上的系统用户组

  EayunOS虚拟化管理中心安装时会自动建立以下用户组：

  * kvm用户组，默认gid为36。组成员包括：
    * vdsm用户。

  * ovirt用户组，默认gid为108。组成员包括：
    * ovirt用户。

1. EayunOS虚拟化宿主机上的系统用户

  EayunOS虚拟化宿主机安装时会自动以下用户：

  * kvm用户组，默认gid为36。组成员包括：
    * vdsm用户。

  * ovirt用户组，默认gid为108。组成员包括：
    * ovirt用户。

1. 普通Linux系统作为虚拟化宿主机时对系统用户组的要求

  普通Linux系统作为虚拟化宿主机时应满足下面的要求：

  * kvm用户组，默认gid为36。组成员包括：
    * vdsm用户。
    * sanlock用户。

  * qemu用户组，默认gid为107。组成员包括：
    * vdsm用户。
sanlock用户。
