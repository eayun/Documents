除了EayunOS本身管理的资源外，EayunOS还可以使用外部系统所管理的资源。提供这些外部资源的供应商(称为外部供应商)可以提供如虚拟主机、虚
拟机映像和网络等资源。

EayunOS当前支持以下外部供应商:

* Foreman (提供主机)

Foreman 是用来管理物理和虚拟主机的一个工具。在 EayunOS 环境中,Foreman 所管理的主机可以作为虚拟主机添加到 EayunOS 中,并被它使用。在 Foreman 服务器被添加到 EayunOS 后,您可以把 Foreman 所管理的主机添加到您的虚拟环境中。

* OpenStack 映像服务(OpenStack Image Service (Glance))

OpenStack 映像服务提供了一组虚拟机映像资源。在 EayunOS 环境中,这些映像可以被导入到 EayunOS 中,作为浮动磁盘或附加到特定虚拟机上的磁盘使用,并被转换为模板。在您把一个 OpenStack 映像服务添加到 EayunOS 后,它会以一个没有附加到任何数据中心的存储域形式出现。EayunOS 环境中的虚拟机磁盘也可以作为虚拟机磁盘映像被导出到 OpenStack 映像服务中。

* 提供网络的 OpenStack Networking (Neutron)

OpenStack Networking提供了软件定义的网络。在 EayunOS 环境中,OpenStack Networking 所提供的网络可以被导入到 EayunOS 中,用来处理网络通信并可以创建负载的网络拓扑结构。在 OpenStack Networking 被添加到 EayunOS 后,您可以把 OpenStack Networking 所提供的网络手动导入到您的虚拟环境中。

>**注意**
>
>在把外部供应商添加到 EayunOS 环境中以前,您需要先设置所有需要添加的外部供应商。请参阅 [Deploying OpenStack: Enterprise Environments(Red Hat Enterprise Linux OpenStack Platform Installer)](http://docs.openstack.org/juno/install-guide/install/yum/content/)来获得更多关于设置外部供应商的信息。
