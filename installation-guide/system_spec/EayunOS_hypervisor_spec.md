# EayunOS 虚拟化宿主机的硬件需求

* EayunOS 虚拟化宿主机对于CPU的要求

   EayunOS 虚拟化宿主机支持以下型号的CPU：

   * AMD Operton G1
   * AMD Operton G2
   * AMD Operton G3
   * AMD Operton G4
   * AMD Operton G5
   * Intel Conroe
   * Intel Penryn
   * Intel Nehalem
   * Intel Westmere
   * Intel Sandybridge
   * Intel Haswell

   CPU必须支持64位技术（Intel® 64 or AMD64），支持 AMD-V™或者Intel VT®虚拟化技术。另外CPU也必须支持NX技术（No eXecute）。部署之前需要检查CPU是否满足上述要求：

   1. 使用 EayunOS 虚拟化宿主机安装光盘引导服务器，进入救援模式（rescue）。

   2. 出现提示符，执行命令：`# grep -E 'svm|vmx' /proc/cpuinfo | grep nx`。

      如果有输出，说明CPU支持虚拟化技术。某些服务器的BIOS中提供了禁用虚拟化技术的选项，需要根据硬件手册确认或者咨询生产厂商。

   3. 检查内核模块kvm有没有加载：`# lsmod | grep kvm`。

      如果输出中包含kvm_intel或者kvm_amd说明模块已经正确加载，CPU满足虚拟化技术的要求。

* EayunOS 虚拟化宿主机对于系统内存的要求

   建议 EayunOS 虚拟化宿主机服务器配置2G以上的内存。以下因素对实际内存的需求产生影响：

   * 虚拟机操作系统对内存的使用；
   * 虚拟机中运行的应用程序对内存的使用；
   * 虚拟机本身对内存的使用。

   KVM 使用了内存 over-commit 技术改善了对虚拟机内存申请的管理，允许在所有虚拟机不是都处于高负载的情况下满足一些虚拟机申请超过物理限制数量的内存。

   目前 EayunOS 虚拟化宿主机支持最大 2T 内存。

* EayunOS 虚拟化宿主机对于存储空间的要求

   建议 EayunOS 虚拟化宿主机至少应该配置2G存储空间，包括：

   * 根分区至少需要500M；
   * 配置文件分区至少需要8M；
   * 日志分区建议至少使用2048M；
   * 数据分区至少使用256M。数据分区过小会导致后期无法进行扩展或者更新。默认情况下，其他分区划分完成之后，所有空闲的存储空间都会分配给数据分区。
   * swap分区至少需要8M。swap分区的推荐大小由服务器的配置，以及内存overcommit的配置决定。 EayunOS 虚拟化宿主机中内存overcommit默认的比例为0.5。

   可以通过下面的 公式确定swap分区的大小：

   * 将物理内存总量乘以overcommit比例，加上
   * 2G（如果系统内存小于等于4G），或者
   * 4G（如果系统内存大于4G小于16G），或者
   * 8G（如果系统内存大于16G小于64G），或者
   * 16G（如果系统内存大于64G小于256G），或者

   > **示例：计算swap分区大小**
   >
   > 对于配置了8G物理内存的服务器来 说，使用上面的说明可以计算得出：
   >
   > (8 GB x 0.5) + 4 GB = 8 GB

<br/>
   > **重要**
   >
   >  EayunOS 虚拟化宿主机安装时会自动使用上述公式计算swap分区大小，内存overcommit比例为0.5。某些情况下，计算得出的swap分区大小 超过了本地磁盘的剩余空间，导致 EayunOS 虚拟化宿主机安装失败。此时可以通过storage_vol引导参数手动设置分区大小。
   > > ##### 示例：手动设置swap分区大小
   > > 下面的示例，只设置swap分区大小 为4096M，没有设置其他分区的大 小，由安装程序自行确定。
   > > storage_vol=:4096::::

<br/>
   > **重要**
   >
   > EayunOS 虚拟化宿主机不支持安装在 fakeraid 设备上。使用 fakeraid 设备时必须重新配置为 non-RAID 的模式。
   > * 进入 RAID 控制器的 BIOS，删除所 有 LUN。
   > * 将控制器设置为 non-RAID 模式（“compatibility”或者“JBOD” 选项，具体需要资源硬件厂商）。
   > 具体的配置方法和说明请咨询硬件厂商。

* EayunOS 虚拟化宿主机对于PCI设备的要求

   EayunOS 虚拟化宿主机至少应该配置1块千兆（或者更高速率）网卡，建议配 置2块网卡以支持对网络要求较高的任务，如虚拟机迁移等。

