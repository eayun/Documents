# 使用 cURL 发送 PUT 请求

下面的 *PUT* 请求将更新虚拟机的内存资源信息。请注意 *PUT*
请求中必须包含一个信息体。

    PUT /api/vms/082c794b-771f-452f-83c9-b2b5a19c0399 HTTP/1.1
    Accept: application/xml
    Content-type: application/xml


    <vm>
      <memory>1073741824</memory>
    </vm>

            

将方法(*PUT*)、HTTP 头(*Accept: application/xml* 及 *Content-type:
application/xml*) 和 URI(*https://[OVIRT
MANAGER]:443/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399*) 匹配入
*cURL* 命令中：

    $ curl -X PUT -H "Accept: application/xml" -H "Content-type: application/xml" -u  --cacert  -d "<vm><memory>1073741824</memory></vm>" https://:443//api/vms/082c794b-771f-452f-83c9-b2b5a19c039
            

此操作将会使用新的配置信息更新虚拟机的内存配置。
