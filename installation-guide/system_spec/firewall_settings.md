### 防火墙配置

1. EayunOS 虚拟化管理中心的防火墙配置

EayunOS 虚拟化管理中心使用的网络端口需要在防火墙中允许通过才能正常提供服务。 EayunOS  Appliance创建 EayunOS 虚拟化管理中心虚拟机时会自动配置防火墙，系统已有的防火墙配置会被覆盖。

安装 EayunOS 虚拟化管理中心之前自行定义的防火墙规则需要手动添加到配置文件中。？？

下面的防火墙配置表格，适用于使用默认配置安装的情况。如果安装时选择了其他的HTTP或者HTTPS端口，请根据实际情况修改。

**EayunOS 虚拟化管理中心的防火墙配置**

|  端口  |  协议  |      来源地址    |    目的地址    |    用途    |
|--------|--------|------------------|----------------|------------|
|        |ICMP    |<ul><li> EayunOS 虚拟化宿主机</li><li>其他独立主机</li></ul>|<ul><li> EayunOS 虚拟化管理中心</li></ul>| EayunOS 虚拟化宿主机向 EayunOS 虚拟化管理中心注册 时，通过ICMP请求确认 EayunOS 虚拟化管理中心是否在线。|
|22      |TCP     |<ul><li>需要对 EayunOS 虚拟化管理中心进行维护管理的系统</li></ul>|<ul><li> EayunOS 虚拟化管理中心</li></ul>|SSH（可选）|
|80, 443 |TCP     |<ul><li>管理门户客户端</li><li>普通用户门户客户端</li><li> EayunOS 虚拟化宿主机</li><li>其他独立主机</li><li>REST API客户端</li></ul>|<ul><li> EayunOS 虚拟化管理中心</li></ul>|通过HTTP或者HTTPS访问 EayunOS 虚拟化管理中心|

> **重要**
>
> 当 EayunOS 虚拟化管理中心服务器还需要提供NFS服务，如ISO存储域，则还需要在防火墙配置增加一些端口：
>
> * NFSv4
>
>   * 2049端口（TCP）
> * NFSv3
>
>   * 2049端口（TCP和UDP）
>   * 111端口（TCP和UDP，rpcbind/sunrpc服务）
>   * 通过MOUNTD_PORT指定的端口（TCP和UDP）
>   * 通过STATD_PORT指定的端口（TCP和UDP）
>   * 通过LOCKD_TCPPORT指定的端口（TCP）
>   * 通过LOCKD_UDPPORT指定的端口（UDP）
>
> MOUNTD_PORT、STATD_PORT、LOCKD_TCPPORT和LOCKD_UDPPORT在`/etc/sysconfig/nfs`中配置。

2. EayunOS 虚拟化宿主机的防火墙配置

使用 EayunOS 虚拟化宿主机光盘安装时会自动配置防火墙。将普通的Linux主机加入 EayunOS 虚拟化环境时需要手动配置防火墙。

**EayunOS 虚拟化管理中心的防火墙配置**

|  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
|--------|--------|----------------|----------------|------------|
|22      |TCP     |<ul><li> EayunOS 虚拟化管理中心</li></ul>|<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|SSH访问连接|
|5900 - 6411|TCP     |<ul><li>访问管理门户的客户端</li><li>访问普通用户门户客户端</li></ul>|<li> EayunOS 虚拟化宿主机</li></li>单独的Linux主机</li></ul>|客户端使用这些端口连接虚拟机的的VNC和SPICE接口。|
|5989    |TCP，UDP|CIMOM           |<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|使用CIMOM监控虚拟机时需要使用该端口|
|16514   |TCP     |<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|使用libvirt进行虚拟机迁移时需要 使用该端口|
|49152 - 49216|TCP     |<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|虚拟机迁移以及VDSM的fencing|
|54321   |TCP     |<ul><li> EayunOS 虚拟化管理中心</li><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>|<ul><li> EayunOS 虚拟化宿主机</li><li>单独的Linux主机</li></ul>| EayunOS 虚拟化管理中心和虚拟化宿主机、虚拟化宿主机和虚拟化宿主机之间VDSM的通信。|

**EayunOS 虚拟化宿主机安装自动生成的防火墙配置**

```
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
```

3. 目录服务的防火墙配置

EayunOS 虚拟化管理中心使用目录服务进行用户管理和验证，针对目录服务也需要对防火墙进行一些配置。

**目录服务的防火墙配置**

|  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
|--------|--------|----------------|----------------|------------|
|88, 464 |TCP，UDP|<ul><li>EayunOS 虚拟化管理中心</li></ul>|<ul><li>目录服务器</li></ul>|Kerberos验证|
|389， 636|TCP     |<ul><li>EayunOS 虚拟化管理中心</li></ul>|<ul><li>目录服务器</li></ul>|使用SSL加密的目录服务访问|

4. 数据库的防火墙配置

EayunOS 虚拟化管理中心可以使用远程数据库服务器，使用远程数据库服务器时需要考虑防火墙的配置。

**数据库的防火墙配置**

|  端口  |  协议  |    来源地址    |    目的地址    |    用途    |
|--------|--------|----------------|----------------|------------|
|5432    |TCP，UDP|<ul><li>EayunOS 虚拟化管理中心</li></ul>|<ul><li>数据库服务器</li></ul>|PostgreSQL数据库的默认监听端口|
