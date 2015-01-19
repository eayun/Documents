# VDSM

VDSM 被 EayunOS 虚拟化管理中心用以管理 EayunOS 虚拟化宿主机和 CentOS 主机。VDSM
管理并监控主机的存储、内存和网络资源。它还负责协调和进行虚拟机创建、数据收集、日志收和其它主机相关的管理任务。VDSM
在由 EayunOS 虚拟化管理中心管理的每个主机上作为守护进程运行，并对来自客户端的
XML-RPC 请求进行应答。EayunOS 虚拟化管理中心作为 VDSM 的客户端工作。

