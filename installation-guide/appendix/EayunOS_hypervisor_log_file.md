# EayunOS 虚拟化宿主机日志文件

**EayunOS 虚拟化宿主机日志文件**

|        日志文件        |        说明        |
|------------------------|--------------------|
|/var/log/ovirt-hosted-engine-setup/ovirt-hosted-engine-setup-yyyymmddhhmmss.log|部署Hosted Engine时产生的日志。（注：部署Hosted Engine才会有此日志）|
|/var/log/libvirt/libvirtd.log|libvirt日志。          |
|/var/log/vdsm/spm-lock.log|记录主机关于SPM角色申请、释放、更新、更新失败的信息。|
|/var/log/vdsm/vdsm.log  |VDSM（虚拟化管理中心在宿主机上的代理程序）日志。|
|/var/log/vdsm/mom.log   |VDSM MOM（内存overcommit管理）日志。|
