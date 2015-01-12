# 使用 cURL

`cURL` 使用命令行接口发送请求至 HTTP
服务器。发起一个请求需要使用如下的命令行语法：

    Usage: 
        

*uri* 参数指的是发送请求的目标 HTTP 服务器地址。这将会是您的 OVIRT
MANAGER主机的地址加上 API 入口路径(*/api*)。

`cURL 选项`

> `-X , --request `
>
> > 要使用的 HTTP 请求命令。在 REST API 的情景中，使用
> > *GET*、*POST*、*PUT* 或者 *DELETE*。
> >
> > 例如：*-X GET*
>
> `-H , --header `
>
> > 发起的请求中要包含的 HTTP 头。如果需要多个 HTTP
> > 头，则使用多次这个选项。
> >
> > 例如：*-H "Accept: application/xml" -H "Content-Type:
> > application/xml"*
>
> `-u , --user `
>
> > 用于登录 OVIRT MANAGER的用户名和密码。此属性是 *Authorization:* HTTP
> > 头的一个易用替代。
> >
> > 例如：*-u admin@internal:abc123*
>
> `--cacert `
>
> > 用于 REST API 的 SSL
> > 通信的证书文件位置。该证书文件保存于本地客户端机器上。使用 *-k*
> > 选项可以忽略 SSL 证书验证。
> >
> > 例如：*--cacert \~/Certificates/ca.crt*
>
> `-d , --data `
>
> > HTTP 请求中要发送的信息体，与 *POST*、*PUT* 或者 *DELETE*
> > 请求方法一同使用。在信息体存在于请求中的情况下请确保同时指定了
> > *Content-Type: application/xml* 头。
> >
> > 例如：*-d "\<cdrom\>\<file
> > id='CentOS-6.5-x86\_64-minimal.iso'/\>\</cdrom\>"*

