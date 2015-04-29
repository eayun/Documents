# 配置Hypervisor的Kernel Dumps

**摘要**

* 选择左侧的 Kdump，切换到 Kdump 界面。
* Hypervisor 支持当遇到系统失败的时候使用 kdump 来导出 kernel dumps。

![node_kdump](../images/node_kdump.png)

1. kdump 产生 crash dumps 可以导出到 NFS 或者 SSH。选择一个更适合你的导出方法并按下【Enter】键或空格键启用它。

   * 导出位置在 NFS 上

      设置到 NFS 上之后，crash log 会被导出到 NFS 上。NFS 必须是完整的 NFS 路径（包含域名和目录）。

   * 导出到 SSH

      设置导出到 SSH，crash log 会被导出到 SSH 存储中。SSH 存储必须是完整的 SSH 登录（包括完整的域名和用户名）。

2. 选择&lt; Save &gt;并按下【Enter】键，保存 Kdump 配置。

**结果**

Kdump 配置成功。
