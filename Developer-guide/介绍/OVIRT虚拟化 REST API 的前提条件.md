# OVIRT虚拟化 REST API 的前提条件

本向导需要如下条件：

1.  一个网络安装的包含 REST API 的OVIRTMANAGER；

2.  一个从 REST API 发送或者接收 HTTP 请求的客户端或程式库。例如：

    1.  OVIRT提供一个 Python 软件开发工具（SDK），它用来与 REST API
        进行通信。本向导包含一个简单的示例来帮助开发者快速入门。

    2.  本向导包括关于使用 cURL 的基本指导。

3.  需要有对超文本传输协议（HTTP）的了解，因为这是与 REST API
    进行交互所使用的协议。互联网工程任务组（IETF）提供了一个请求评议（RFC）来解释超文本传输协议：http://www.ietf.org/rfc/rfc2616.txt；并且，

4.  需要对可扩展标记语音（XML）的了解，因为 API
    使用它来构建资源的展现方式。W3C
    提供了所有的规范：http://www.w3.org/TR/xml/。

> **Note**
>
> 每一个版本的OVIRT企业虚拟化都有一个独特相关联的 SDK。请确保你所使用的
> SDK
> 能和你当前的环境吻合。例如，如果你所使用的是OVIRT企业虚拟化的3.2版本，你就需要使用对应3.2版本的
> SDK。

需要补充的是，如果你需要使用 Python SDK 的话你需要下载并安装
ovirt-engine-sdk-python
软件包。更加详细的信息可以参考OVIRT虚拟化安装手册来获知如何下载并安装它们。

