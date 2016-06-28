# ovirt-engine-notifier.conf 文件中关于事件通知的参数

事件通知器的配置文件是
`/usr/share/ovirt-engine/services/ovirt-engine-notifier/ovirt-engine-notifier.conf`。

**ovirt-engine-notifier.conf 文件变量**

|变量名|默认值|备注|
|------|------|----|
|SENSITIVE\_KEYS|无|一组以逗号分隔的，不会被记录到日志中的密钥。|
|JBOSS\_HOME|/usr/share/jbossas|Red Hat Enterprise Virtualization Manager 使用的 JBoss 应用服务器的位置。|
|ENGINE\_ETC|/etc/ovirt-engine|Red Hat Enterprise Virtualization Manager 使用的 etc 目录的位置。|
|ENGINE\_LOG|/var/log/ovirt-engine|Red Hat Enterprise Virtualization Manager 使用的 logs 目录的位置。|
|ENGINE\_USR| /usr/share/ovirt-engine|Red Hat Enterprise Virtualization Manager 使用 user 的目录的位置。|
|ENGINE\_JAVA\_MODULEPATH|\${ENGINE\_USR}/modules|Java 模块所在的位置。JBoss 的位置需要被添加，但不能添加到这里，否则会指向一个不同的路径。|
|NOTIFIER\_DEBUG\_ADDRESS|无|一台机器的地址。这个机器被用来对事件通知器所使用的 Java 虚拟机进行远程故障排除。|
|NOTIFIER\_STOP\_TIME|30|这个服务超时的时间（以秒为单位）|
|NOTIFIER\_STOP\_INTERVAL|1|超时计数器值增加的间隔时间（以秒为单位）。|
|INTERVAL\_IN\_SECONDS|120|向订阅了事件通知的用户发送通知的时间间隔，以秒为单位。|
|IDLE\_INTERVAL|30|低优先级任务执行的间隔时间（以秒为单位）。|
|DAYS\_TO\_KEEP\_HISTORY|0|产生事件通知的事件在历史记录表中保存的天数。如果这个参数没有设置，这些事件会被永久保存在历史记录表中。|
|FAILED\_QUERIES\_NOTIFICATION\_THRESHOLD|30|指定在事件通知邮件发出后，经过多少次相同的失败查询后才再发出通知。例如，这个变量被设为3，在一个查询失败后发出了一个事件通知，下一次只有发生了 3 次相同的查询失败后才会再次发送这个事件通知。如果您把这个变量的值设为 0 或 1，每次查询失败后都会发送一个通知邮件。|
|FAILED\_QUERIES\_NOTIFICATION\_RECIPIENTS|无|接收通知邮件的用户的邮件地址。用户可以指定多个用户的邮件地址（使用逗号分隔）。这个变量现在已经被 FILTER 变量替代。|
|DAYS\_TO\_SEND\_ON\_STARTUP|0|当事件通知器启动时，多少天前的事件需要被处理并发送事件通知。|
|FILTER|exclude:\*|决定触发事件的条件，以及接收邮件通知的用户的邮件地址。这个变量的值由 include 或 exclude，事件和接收者的邮件组成。例如，include:VDC\_START(smtp:mail@example.com) \${FILTER}。|
|MAIL\_SERVER|无|SMTP 邮件服务器地址。必须填写此变量, 事件通知器才能够正常工作。|
|MAIL\_PORT|25|使用不安全连接的 SMTP 服务器的默认端口是 25。使用安全连接（启用了 SSL）的 SMTP 服务器的默认端口是 465。|
|MAIL\_USER|无|如果 SMTP 服务器启用了 SSL 来验证用户，则此变量必须被设置。在 MAIL\_FROM 变量未被设置的情况下，此变量还将会被用以指定发送邮件的用户地址。有些邮件服务器可能不支持此功能。此变量所填的地址必须为 RFC822 格式。|
|SENSITIVE\_KEYS|\${SENSITIVE\_KEYS},MAIL\_PASSWORD|如果邮件服务器需要用户验证，或启用了 SSL 或 TLS，在这里指定用户的验证信息。|
|MAIL\_PASSWORD|无|此变量在邮件服务器要求用户验证或者启用了 SSL 的情况下必须被设置。|
|MAIL\_SMTP\_ENCRYPTION|无|邮件所使用的加密方法。可能的值包括 none、ssl 和 tls。|
|HTML\_MESSAGE\_FORMAT|false|如果此变量被设置为“true”，则邮件服务器将以 HTML 格式发送事件通知信息。|
|MAIL\_FROM|无|如果邮件服务器支持，则此变量将指定符合 RFC822 格式的“from”地址。|
|MAIL\_REPLY\_TO|无|如果邮件服务器支持，则此变量将指定符合 RFC822 格式的“reply-to”地址。|
|MAIL\_SEND\_INTERVAL|1|	每个 IDLE\_INTERVAL 所发的 SMTP 信息数|
|MAIL\_RETRIES|4|在确定操作失败前，尝试发送邮件的次数。|
|SNMP\_MANAGER|无|	作为 SNMP 管理器的机器的 IP 地址或全局域名。如果需要输入多个机器的信息，以一个空格分隔它们（可以包括一个端口号）。如 manager1.example.com manager2.example.com:164。|
|SNMP\_COMMUNITY|public|	默认的 SNMP community。|
|SNMP\_OID|1.3.6.1.4.1.2312.13.1.1|	提示信息的默认 TRAP 对象标识符（object identifier）。|
|ENGINE\_INTERVAL\_IN\_SECONDS|300|对 Manager 所在机器进行监测的间隔时间（以秒为单位）。这个间隔是从监测完成后开始计算的。|
|ENGINE\_MONITOR\_RETRIES|3|当对 Manager 所在的机器状态进行监测失败后，重新尝试监控的次数。|
|ENGINE\_TIMEOUT\_IN\_SECONDS|30|监测 Manager 所在机器状态的超时时间（以秒为单位）。当达到这个超时时间后没有获得所监测机器的状态，事件通知器会在指定的间隔时间后重新尝试对机器进行监测。|
|IS\_HTTPS\_PROTOCOL|false|	如果 JBoss 以安全模式运行，这个项必须被设为 true。|
|SSL\_PROTOCOL|TLS|	在 SSL 被启用后，JBoss 配置连接器（JBoss configuration connector）所使用的协议。|
|SSL\_IGNORE\_CERTIFICATE\_ERRORS|false|	如果 JBoss 以安全模式运行，并需要忽略 SSL 错误，这个值必须设为 true。|
|SSL\_IGNORE\_HOST\_VERIFICATION|	false|如果 JBoss 以安全模式运行，并需要忽略主机名验证，这个值必须设为 true。|
|REPEAT\_NON\_RESPONSIVE\_NOTIFICATION|false|	这个变量被用来指定，当 Manager 所在的机器没有响应时，是否向相关的用户重复发送错误信息。|
|ENGINE\_PID|/var/lib/ovirt-engine/ovirt-engine.pid|	Red Hat Enterprise Virtualization Manager 的 PID 的路径和文件名。|


