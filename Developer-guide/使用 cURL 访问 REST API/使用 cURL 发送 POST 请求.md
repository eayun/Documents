# 使用 cURL 发送 POST 请求

下面的 *POST* 请求将在 *vms* 集合中创建一个虚拟机。请注意 *POST*
请求中必须包含一个信息体。

    POST /api/vms HTTP/1.1
    Accept: application/xml
    Content-type: application/xml


    <vm>
      <name>vm1</name>
      <cluster>
        <name>default</name>
      </cluster>
      <template>
        <name>Blank</name>
      </template>
      <memory>536870912</memory>
      <os>
        <boot dev="hd"/>
      </os>
    </vm>

            

将方法(*POST*)、HTTP 头(*Accept: application/xml* 及 *Content-type:
application/xml*)、URI(*https://[OVIRT MANAGER]:443/api/vms*)
和请求的信息体一同匹配入 *cURL* 命令中：

    $ curl -X POST -H "Accept: application/xml" -H "Content-type: application/xml" -u  --cacert  -d "<vm><name>vm1</name><cluster><name>default</name></cluster><template><name>Blank</name></template><memory>536870912</memory><os><boot dev='hd'/></os></vm>" https://:443/api/vms
            

此操作将会创建一个虚拟机并将其资源的 XML 表示显示出来。
