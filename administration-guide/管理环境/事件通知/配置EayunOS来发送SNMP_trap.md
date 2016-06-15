# 配置 EayunOS 来发送 SNMP trap
**概述**<br/>
配置 EayunOS Manager 来向一个或多个外部简单网络管理协议（Simple Network Management Protocol，简称 SNMP）管理器发送 SNMP trap 。SNMP trap 包括了系统事件信息，用户可以使用这些数据监控 EayunOS 环境。向 SNMP 管理器发送的 trap 的数量和类型可以在 EayunOS Manager 中设置。

这个过程假设您已经配置了一个或多个外部 SNMP 管理器来接收 trap，并且有以下信息：

> 作为 SNMP 管理器的机器的 IP 地址或完全限定域名（FQDN）。另外，需要决定管理器使用哪个端口接收 trap 数据（默认的设置是 UDP 端口 162）。

> SNMP community。多个 SNMP 管理器可以属于一个 community。只有属于同一个 community 的管理系统和代理才可以相互间进行交流。默认的 community 是 public。

> trap 信息的对象 ID（object identifier，简称为 OID）。EayunOS Manager 提供的默认 OID 是 1.3.6.1.4.1.2312.13.1.1。当 OID 被定义后，所有 trap 类型（包括了事件信息）都会被发送到 SNMP 管理器。请注意，修改默认的 trap 会导致所产生的 trap 和 Manager 的 MIB（Management Information Base，管理信息库）不匹配。

> **注意**

> EayunOS Manager 在 /usr/share/doc/ovirt-engine/mibs/OVIRT-MIB.txt 和 /usr/share/doc/ovirt-engine/mibs/REDHAT-MIB.txt 中提供了管理信息库（MIB）。在进行处理前，需要把 MIBs 加载到 SNMP 管理器中。

默认的 SNMP 配置值存在于 Manager 的事件通知守护进程的配置文件中（/usr/share/ovirt-engine/services/ovirt-engine-notifier/ovirt-engine-notifier.conf）。以下所使用的值是基于这个文件所提供的默认或示例值。如需修改默认设置，我们推荐您使用另外一个文件来覆盖默认设置，而不是直接修改 ovirt-engine-notifier.conf  文件，这样可以在需要对系统进行改变时（如对系统进行升级）保持您原来所做的配置改变。

**在 Manager 上配置 SNMP trap**

1. 在 Manager 上创建 SNMP 配置文件：

    vi /etc/ovirt-engine/notifier/notifier.conf.d/20-snmp.conf

2. 使用以下格式指定 SNMP 管理器，SNMP community 和 OID：

    SNMP_MANAGERS="manager1.example.com
    manager2.example.com:162"
    SNMP_COMMUNITY=public
    SNMP_OID=1.3.6.1.4.1.2312.13.1.1

3. 指定哪些事件需要发送到 SNMP 管理器：

事件实例

把所有的事件发送到默认的 SNMP 档案：

    FILTER="include:*(snmp:) ${FILTER}"

把所有严重性为 ERROR 或 ALERT 的事件发送到 SNMP 档案：

    FILTER="include:*ERROR(snmp:) ${FILTER}"
    FILTER="include:*ALERT(snmp:) ${FILTER}"

把 VDC_START 事件发送到指定的电子邮件地址：

    FILTER="include:VDC_START(snmp:mail@example.com) ${FILTER}"

把除 VDC_START 以外的事件发送到默认的 SNMP 档案：

    FILTER="exclude:VDC_START include:*(snmp:) ${FILTER}"

默认的过滤器在 ovirt-engine-notifier.conf 中定义。如果没有禁用这个过滤器或使用覆盖的过滤器，则不会发送通告信息：

    FILTER="exclude:*"

VDC_START 是一个有效审计日志信息的示例。完整的审计日志信息列表包括在 

/usr/share/doc/ovirt-engine/AuditLogMessages.properties

中。另外，还可以在 SNMP manager 中对结果进行过滤。

4. 保存这个文件。

5. 启动 ovirt-engine-notifier 服务，并使它可以在系统启动时被自动启动：

    service ovirt-engine-notifier start
    chkconfig ovirt-engine-notifier on

检查您的 SNMP 管理器来确定它可以接收到 trap。

> **注意**

> 为了使 notifier 服务可以正常运行，SNMP_MANAGERS 和 MAIL_SERVER 需要在 /usr/share/ovirt-engine/services/ovirt-engine-notifier/ovirt-engine-notifier.conf 中（或一个覆盖文件中）正确定义。

