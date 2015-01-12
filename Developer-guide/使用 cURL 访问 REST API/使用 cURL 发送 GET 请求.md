# 使用 cURL 发送 GET 请求

下面的 *GET* 请求将列出 *vms* 集合中的虚拟机。请注意 *GET*
请求中不包含信息体。

    GET /api/vms HTTP/1.1
    Accept: application/xml
            

将方法(*GET*)、HTTP 头(*Accept: application/xml*) 和 URI(*https://[OVIRT
MANAGER]:443/api/vms*) 匹配入 *cURL* 命令中：

    $ curl -X GET -H "Accept: application/xml" -u  --cacert  https://:443/api/vms
            

*vms* 集合的一个 XML 表示将作为返回结果显示出来。
