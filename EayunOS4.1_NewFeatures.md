# EayunOS4.1新特性列表

* 摘要

  EayunOS4.1基于oVirt3.5，包含oVirt3.5的特性，并且包含团队自己开发的一些功能。

> #### 新增功能如下


|功能编号|特性名称|简要描述|文档链接|
|--------|--------|--------|--------|
|1|USB穿透功能|开发了USB穿透功能，能够在webadmin门户上挂载USB|[Host Usb的使用](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/Host_Usb.md)|
|2|虚拟机备份|开发了虚拟机备份功能，提供了虚拟机的定时备份，可以在webadmin门户上设置备份策略进行备份|[虚拟机备份的使用](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/VM_Backup.md)<br /><ul><li>**注释**：目前虚拟机备份已经实现自动初始化，因此初始化部分可以忽略。</li></ul>|
|3|域控管理|开发了域控管理功能，目录服务域的添加可以在webadmin门户上完成，无需使用命令行|<ul><li>[域控的介绍](https://github.com/eayun/UIPlugin-Engine-Manage-Domains/blob/master/README.md)</li><li>[域控的使用](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/Engine_Manage_Domains.md)</li></ul>|
|4|报表功能|加入报表功能，报表门户能够使用；同时可以通过报表对虚拟机的使用情况进行监控||
|5|管理节点的控制台功能|使用Hosted Engine架构，能够在webadmin门户通过控制台打开管理节点的控制台||
|6|管理节点的控制台界面|提供类似Node节点的控制台界面，可以直接通过界面进行操作|[管理节点控制台界面的解释](https://github.com/eayun/Documents/blob/master/installation-guide/Appendix.md#engine-console%E7%9A%84%E4%BD%BF%E7%94%A8)|
|7|管理节点的高可用功能|使用Hosted Engine架构，管理节点为高可用节点|<ul><li>[HostedEngine高可用的测试用例](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/HostedEngine_HA.md)</li><li>[HostedEngine一些命令介绍](https://github.com/eayun/Documents/blob/master/installation-guide/Appendix.md#hosted-engine%E5%91%BD%E4%BB%A4)</li></ul>|
|8|WGT_DOMAIN|在Appliance中封装了WGT_DOMAIN，里面包含VirtIO驱动，初始化后可以直接使用|[WGT_DOMAIN的初始化和使用](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/WGT_DOMAIN.md)|
|9|界面美化|重新调整界面，对界面进行了美化||
|10|灾难恢复机制|支持导入数据域（而不仅仅是导出域），可以实现一定的灾难恢复|[存储域导出的测试用例](https://github.com/eayun/EayunOS-testcase/blob/master/Evaluation_Test/ImportStorageDomain.md)<br /><ul><li>**注意**：由于数据库中的设置，虚拟机的数据每隔一个小时同步一次，因此,测试的话，虚拟机新建以后超过一个小时，才能被导入到另一个环境中</li></ul>|
|11|虚拟机任务队列|增加虚拟机的调度策略功能，实现任务队列||
|12|导入License||


> #### 我们的改进


|编号|描述|解决|
|----|----|----|
|1|去掉oVirt字样|去掉oVirt字样，替换为EayunOS|
|2|虚拟机重启后，事件发生变化|已解决，虚拟机启动后的时间与主机时间相同|
|3|webadmin能够自动调整分辨率问题|已解决|
|4|iSCSI存储修改IP|可通过导入存储域的方法实现|


> #### 此版本暂不实现的功能


|功能编号|功能名称|备注|
|--------|--------|----|
|1|无电源管理的主机HA|下个版本考虑|
|2|ISO在webadmin中上传|此版本发布后作为附加功能单独发布|


> #### oVirt3.5中值的关注的特性


|特性编号|特性名称|简要描述|
|--------|--------|--------|
|1|同一个数据中心可以使用多种存储类型|同一个数据中心里，可以添加多种类型的存储，如同时使用NFS和iSCSI存储。但只有一个存储可以作为主存储|
|2|编辑运行中的虚拟机|可以编辑运行中的虚拟机，但有一部分修改是可以立即生效的，如描述、注释、是否高可用等；有一部分修改需要将虚拟机关闭后重新启动才能生效，如保证的内存、cd-rom等；有一部分修改是不能生效的，如内存、usb策略等。在修改时会有相关提示|
|3|虚拟机热插入CPU|虚拟机运行过程中可以热插入CPU，但是热拔出功能尚未实现|
|4|虚拟机重启|界面上提供虚拟机的重启按钮，该按钮相当于在虚拟机中执行了重启的操作。注意：此处的重启与关闭虚拟机后再次启动是不一样的|
|5|虚拟机的Affinity组|允许设置虚拟机设置Affinity组，加入组中的虚拟机可以设置为在必须（或可选地）在同一台主机上运行或必须（或可选地）在不同主机上运行|
|6|虚拟机可迁移到另一个集群中|注意是迁移到另一个**集群**|
|7|主机状况的周期检查|对设置了电源管理的主机，可以启用周期健康检查，在设置了检查周期后，电源管理周期性检查主机的状况|
|8|导入存储域|可以直接导入某个存储域到现有的环境中，可用户备份和灾难恢复|

