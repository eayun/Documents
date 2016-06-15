# EayunOS Node 日志文件

**日志文件**

|日志文件|说明|
|--------|----|
|**/var/log/libvirt/libvirtd.log**|**libvirt** 日志。|
|**/var/log/vdsm/spm-lock.log**|记录主机关于 SPM 角色申请、释放、更新、更新失败的信息。|
|**/var/log/vdsm/vdsm.log**|VDSM（MANAGER在宿主机上的代理程序）日志。|
|**/var/log/vdsm/mom.log**|VDSM MOM（内存overcommit管理）日志。|
|**/tmp/ovirt-host-deploy-@DATE@.log**|部署主机所生成的日志，当主机成功部署完成后，会将该日志文件复制到 EayunOS Manager 中，以文件 /var/log/ovirt-engine/host-deploy/ovirt-@DATE@-@HOST@-@CORRELATION\_ID@.log 得形式保存在 Manager 中。|
