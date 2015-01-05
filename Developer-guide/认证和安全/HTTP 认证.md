# HTTP 认证

任何一个OVIRT企业虚拟化账户都可以访问 REST API。一个 API
用户在发出请求时必须要提供OVIRTMANAGER的用户名和密码。每一个请求都使用了
HTTP
的基本授权方式[2]来加密这些凭证。如果一个请求不包含合适的认证头（*Authorization*
header），API 将返回一个状态码为401的结果（*401 Authorization
Required*）。

    HEAD [base] HTTP/1.1
    Host: [host]

    HTTP/1.1 401 Authorization Required
          

请求将会携带一个给某个指定域（realm）的认证头。并且一个 API
用户将会加密正确的OVIRTMANAGER的域与用户信息并保存在凭证中，凭证的格式为
*username@domain:password*。

下表展示了用 base64 加密凭证的过程。

|属性|值|
|----|---|
|用户名|OVIRTadmin|
|域|domain.example.com|
|密码|123456|
|未加密的凭证|OVIRTadmin@domain.example.com:123456|
|base64 加密的凭证|cmhldm1hZG1pbkBibGFjay5xdW1yYW5ldC5jb206MTIzNDU2|

一个 API 用户提供如下的基于 base64 加密的凭证：

    HEAD [base] HTTP/1.1
    Host: [host]
    Authorization: Basic cmhldm1hZG1pbkBibGFjay5xdW1yYW5ldC5jb206MTIzNDU2

    HTTP/1.1 200 OK
    ...
          

> **Important**
>
> 基本的认证牵涉到潜在的敏感数据，例如密码，将会以明文传输。REST API
> 要求使用超文本安全传输协议（HTTPS）来在传输层上加密请求的明文数据。

> **Important**
>
> 有一些 base64
> 的库会将结果分成多行并且在每行后会增加一个换行符。这将会破坏消息头且造成一次失败的请求。认证消息头要求加密的凭证要在消息头的一行之内。

