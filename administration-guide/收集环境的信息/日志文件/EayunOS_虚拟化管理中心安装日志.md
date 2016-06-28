# EayunOS 虚拟化管理中心安装日志

**安装日志**

|日志文件|说明|
|--------|----|
|**/var/log/ovirt-engine/engine-cleanup\_yyyy\_mm\_dd\_hh\_mm\_ss.log**|执行 **engine-cleanup** 时所产生的日志。该命令用于重置 EayunOS 虚拟化管理中心 的环境。每一次执行这个命令都会生成一个日志，在日志文件名中加上执行命令的日期和时间，可以允许存在多个日志文件。|
|**/var/log/ovirt-engine/setup/ovirt-engine-setup-yyyymmddhhmmss.log**|EayunOS 虚拟化管理中心安装时产生的日志。|
|**/var/log/ovirt-engine/engine-db-install-yyyy\_mm\_dd\_hh\_mm\_ss.log**|**engine-setup** 命令的日志文件。它包括了创建和配置 rhevm 数据库的详细信息。|
|**/var/log/ovirt-engine/rhevm-dwh-setup-yyyy_mm_dd_hh_mm_ss.log**|**rhevm-dwh-setup** 命令的日志文件。这个命令被用来创建 ovirt\_engine\_history 数据库，它在每次运行时都会产生一个日志文件。这个命令的日志文件的文件名中包括了运行的日期和时间，因此多个日志文件可以同时存在。|
|**/var/log/ovirt-engine/ovirt-engine-reports-setup-yyyy_mm_dd_hh_mm_ss.log**|**rhevm-reports-setup** 命令的日志文件。它在每次运行时都会产生一个日志文件。这个命令的日志文件的文件名中包括了运行的日期和时间，因此多个日志文件可以同时存在。|

