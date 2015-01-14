# engine-log-collector 命令行参数说明

engine-log-collector 的基本使用方法如下：

```
    engine-log-collector [options] list [all, clusters, datacenters]
    engine-image-uploader [options] collect
```

2种操作模式：***list*** 和 ***collect***。

* ***list*** 操作会列出 EayunOS Manager 中的数据中心、集群或者主机。

* ***collect*** 操作会从 EayunOS Manager 抓取相关的日志和信息，并打包放置在 **/tmp/logcollector** 目录下。

如果没有指定其他参数，默认的操作是自动收集当前Manager 中所有数据中心、集群和主机相关的信息和日志，并打包。

**engine-log-collector** 提供了一些参数对命令的行为进行控制。

***--version***

  显示命令版本信息。

***-h, --help***

  显示命令帮助信息。

***--conf-file=[PATH]***

  指定配置文件。

***--local-tmp=[PATH]***

  指定收集到的日志文件的存放路径。默认的路径是：**/tmp/logcollector**。

***--ticket-number=[TICKET]***

  指定 ticket 序号，主要用于区分生成的日志文件的名称。

***--upload=FTP_SERVER***

  日志收集完成之后上传到指定的 FTP 服务器。

***--log-file=[PATH]***

  指定记录命令输出的日志文件。

***--quiet***

  启用该选项之后，将命令的输出减少到最少。该选项默认是不启用的。

***-v, --verbose***

  启用该选项之后，命令将输出尽可能详细的信息。该选项默认是不启用的。

**EayunOS Manager 选项**

下面这些选项可能指定访问 EayunOS Manager 时验证登录的方式、选择需要收集的日志或者信息的类型、来源等。

这些选项可以配合使用，如：

**engine-log-collector --user=admin@internal --cluster ClusterA,ClusterB --hosts "SalesHost"\***

将使用 **admin@internal** 登录 Manager，并收集 ClusterA 和 ClusterB 这2个集群中所有 **SaleHost** 主机的日志和信息。

***--no-hypervisors***

  不收机主机相关的日志和信息。

***-u [USER], --user=[USER]***

  登录Manager 时使用的用户。用户名的格式为：user@domain。同时用户必须在 EayunOS Manager 中已经存在。

***-r [FQDN], --rhev=[FQDN]***

  指定目标 EayunOS Manager 服务器的 FQDN 域名。默认是 localhost，即运行该命令的服务器和 EayunOS Manager 是同一台服务器。

***-c [CLUSTER], --cluster=[CLUSTER]***

  收集指定集群（可以是多个）相关的日志和信息。如果指定多个集群，集群名之间使用“,”分隔。支持使用通配符。

***-d [DATACENTER], --data-center=[DATACENTER]***

  收集指定数据中心（可以是多个）相关的日志和信息。如果指定多个数据中心，数据中心名之间使用“,“分隔。支持使用通配符。

***-H [HOST_LIST], --hosts=[HOST_LIST]***

  收集指定主机（或者多个主机）相关的日志和信息。多个主机使用“,”分割，可以使用主机名、ip地址，fqdn域名，也支持使用通配符。

**SOS 报告选项**

日志收集工具使用了 JBoss SOS 插件。使用下面的选项可以从 JMX 终端收集信息。

***--jboss-home=JBOSS\_HOME***

  JBoss的安装目录，默认是 **/var/lib/jbossas**。

***--java-home=JAVA\_HOME***

  Java的安装目录，默认是 **/usr/share/jvm/java**。

***--jboss-profile=JBOSS\_PROFILE***

  指定日志收集使用的 Jboss Profile 配置。

***--enable-jmx***

  从 EayunOS Manager 的 JMX 接口获取日志和信息。

***--jboss-user=JBOSS\_USER***

  调用 JBoss JMX 接口的用户，默认是 ***admin***。

***--jboss-logsize=LOG\_SIZE***

  最终生成的日志文件的最大体积（单位为MB）。

***--jboss-stdjar=STATE***

  是否收集 JBoss 标准 JAR 状态信息。STATE 可选的值为 **on** 或者 **off**，默认为 **on**。

***--jboss-servjar=STATE***

  是否收集所有服务配置目录下的 JAR 状态信息。STATE 可选的值为 **on** 或者 **off**，默认为 **on**。

***--jboss-twiddle=STATE***

  是否收集 twiddle 数据。STATE 可选的值为 **on** 或者 **off**，默认是 **on**。

***--jboss-appxml=XML\_LIST***

  指定需要收集的应用的XML描述。默认为 **all**。

**SSH 选项**

***--ssh-port=[PORT]***

  连接虚拟机时 SSH 服务的端口。

***-k [KEYFILE], --key-file=[KEYFILE]***

  指定通过 SSH 连接虚拟机时使用的公钥文件。

***--max-connections=[MAC_CONNECTION]***

  设置与虚拟机之间的 SSH 连接的 MAX\_CONNECTIONS (最大连接) 参数，默认为10。

**PostgreSQL 数据库选项**

如果更改了 EayunOS Manager 数据库名和数据库用户，则需要使用 ***pg-user*** 和 ***dbname*** 指定数据库用户名和数据库名。

如果数据库不再本地，则需要通过 ***pg-hostdb*** 指定数据库所在的服务器的日志。可以使用 ***pg-host-key*** 参数来收集远程日志。需要在远程数据库上安装 SOS 插件才能成功收集日志记录。

***--no-postgresql***

  不收集数据库相关日志和信息。默认该选项没有开启。

***--pg-user=[USER]***

  指定连接数据库使用的用户。默认为 **postgres**。

***--pg-dbname=[DBNAME]***

  指定连接到数据库服务器要访问的数据库名称，默认为 **engine**。

***--pg-dbhost=[DBHOST]***

  指定数据库服务器的主机名。默认为 **localhost**。

***--pg-host-key=[KEYFILE]***

  指定访问数据库时使用的公钥。这个值默认是不设置的。当数据库服务器不在本地时，需要使用该选项。
