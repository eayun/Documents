# Python 快速开始文档介绍

本章提供了一系列例子来演示怎样用 Python 从一个基本的 OVIRT
环境中创建虚拟机.

这些例子使用 ovirt-engine-sdk-python 软件包提供的 ovirtsdk 来完成.

为了完成本章的例子, 用户必须具有下列条件:

-   已经安装好的 OVIRT, 并且该管理系统可以联网.

-   安装配置好的 EayunOS Hypervisor, 并且该系统可以联网.

-   一个可以用来安装虚拟机操作系统的 ISO 镜像.

-   理解 OVIRT 中的基本组成元素.

-   了解基本的 Python 编程语言.

> **Important**
>
> 所有的 Python 示例都包含占位符(*USER*和*PASS*),
> 根据你的实际情况填写这些值.

> **Note**
>
> OVIRT 为每个资源生成一个 GUID 来标记这些资源, 在下面的例子中这些 GUID
> 可能不同.

> **Note**
>
> 这些 Python 例子只包含基本的异常和错误处理逻辑. 更多的异常处理请参考
> *ovirtsdk.infrastructure.errors* 模块.

