# 使用 cURL 发送带有信息体的 DELETE 请求

下面的 *DELETE* 请求将使用可选的信息体作为选项删除一个虚拟机资源。

    DELETE /api/vms/082c794b-771f-452f-83c9-b2b5a19c0399 HTTP/1.1
    Accept: application/xml
    Content-type: application/xml


    <action>
      <force>true</force>
    </action>

            

将方法(*DELETE*)、HTTP 头(*Accept: application/xml* 及 *Content-type:
application/xml*) 和 URI(*https://[OVIRT
MANAGER]:443/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399*) 匹配入
*cURL* 命令中：

    $ curl -X DELETE -H "Accept: application/xml" -H "Content-type: application/xml" -u  --cacert  -d "<action><force>true</force></action>" https://:443/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399
            

此操作将会强制删除该资源所代表的虚拟机。

