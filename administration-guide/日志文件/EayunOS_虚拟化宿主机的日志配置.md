# EayunOS Node 的日志配置

**概要**

EayunOS Node 的配置界面中的Logging可以配置将日志信息传输到远程服务器。

**配置主机以使用远程日志服务器**

* 可以选择以下两种方案之一

  logrotate 简化了对于日志文件的管理。EayunOS Node 中日志文件的大小到达指定限制时会自动进行轮转操作。

  logrotate 会将日志文件重命名，并新建一个使用原来文件名的空日志文件。配置界面中的“Logrotate Max LogSize”中配置的数值，决定日志文件是否需要轮转。

  **Logrotate Max Log Size** 中数值的单位是 kb，默认值为 1024。

  * rsyslog 是EayunOS Node 上使用的日志服务程序。通过配置 rsyslog，可以将 EayunOS Node 的日志传输到远程服务器上。

    1. 在 **Server Address** 中填入远程日志服务器的地址（ip或者域名、主机名）。
    1. 在 **Server Port** 中填入远程日志服务器日志服务程序的监听端口，默认为 514。

  * netconsole 可以将内核信息传输到远程日志服务器。

    1. 在 **Server Address** 中填入远程日志服务器的地址。
    1. 在 **Server Port** 中填入远程日志服务器日志服务程序的监听端口，默认为 6666。

  选中“Save”，敲击回车键保存配置。

**结果**

EayunOS Node 上日志将会发送到远程日志服务器。

