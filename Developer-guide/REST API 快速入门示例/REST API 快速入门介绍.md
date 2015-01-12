# REST API 快速入门介绍

本章将要介绍如何使用 REST API
来创建一个基本的OVIRT虚拟化环境以及如何创建一台虚拟机。

在标准的需求下，还需要以下条件来完成入门示例：

-   一台能网络连通的且配置好的OVIRT企业虚拟化主机；

-   一个包含操作系统的 ISO 镜像文件。本章使用 CentOS 6 作为 ISO
    安装的示例。并且使用

-   OVIRT企业虚拟化的 *engine-iso-uploader*
    工具来上传已选择的操作系统镜像文件。

本示例通过一个客户端使用 *cURL* 来演示 REST 请求。请注意任何能够兼容
HTTP 的客户端程序都能使用 *cURL*。

> **Important**
>
> 为了简洁，本示例中的 HTTP 请求中的头信息只发送 *Host:* 和
> *Authorization:*
> 属性。但是这些属性都是一定需要的并且会根据你的OVIRTMANAGER的安装环境指定不同的值。

> **Important**
>
> 所有的用来认证的细节（*USER:PASS*）和证书位置（*CERT*）的 *cURL*
> 示例都包括占位符。

> **Note**
>
> OVIRTMANAGER会生成一个全局唯一标识符（GUID）作为每一个资源的 *id*
> 属性。本示例中的标识码将会与你的OVIRT企业虚拟化环境的标识码有所不一样。

