# 使用 cURL 发送 DELETE 请求

下面的 *DELETE* 将删除一个虚拟机资源。

    DELETE /api/vms/082c794b-771f-452f-83c9-b2b5a19c0399 HTTP/1.1
            

将方法(*DELETE*) 和 URI(*https://[OVIRT
MANAGER]:443/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399*) 匹配入
*cURL* 命令中：

    $ curl -X DELETE -u  --cacert  https://:443/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399
            

此操作将会删除该资源所代表的虚拟机。请注意在这里 *Accept:
application/xml* 的 HTTP 头是可选的，因为 *DELETE* 的返回为空。
