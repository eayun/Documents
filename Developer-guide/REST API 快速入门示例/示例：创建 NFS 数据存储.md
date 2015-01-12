# 示例：创建 NFS 数据存储

一个 NFS 数据存储是一个导出的 NFS
共享存储，被附加在了一个数据中心，并且提供虚拟客户机的镜像存储。创建一个
NFS 数据存储需要一个 POST
请求，并且提供数据存储的描述信息，该请求发给数据存储资源集合的 URL。

*请求：*

              
    POST /api/storagedomains HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <storage_domain>
     <name>data1</name>
     <type>data</type>
     <storage>
     <type>nfs</type>
     <address>192.168.0.10</address>
     <path>/data1</path>
     </storage>
     <host>
     <name>hypervisor</name>
     </host>
    </storage_domain>

            

*cURL 命令：*

              
    # curl -X POST -H "Accept: application/xml" -H "Content-Type: application/xml"
    \
     -u [USER:PASS] --cacert [CERT] \
     -d "<storage_domain><name>data1</name><type>data</type> \
     <storage><type>nfs</type><address>192.168.0.10</address> \
     <path>/data1</path></storage> \
     <host><name>hypervisor</name></host></storage_domain>" \
     https://[EayunOS Host]:443/api/storagedomains

            

该 API 创建了一个名为 *data1* 的 NFS 数据存储，且它的导出路径为
*192.168.0.10:/data1*，并且通过NODE来设置到存储的连接。该 API
同时返回了新建的数据存储的如下资源展现。

*结果：*

              
    HTTP/1.1 200 OK
    Accept: application/xml
    <storage_domain id="9ca7cb40-9a2a-4513-acef-dc254af57aac"
     href="/api/storagedomains/9ca7cb40-9a2a-4513-acef-dc254af57aac">
     <name>data1</name>
     <link rel="permissions"
     href="/api/storagedomains/9ca7cb40-9a2a-4513-acef-dc254af57aac/
     permissions"/>
     <link rel="files"
     href="/api/storagedomains/9ca7cb40-9a2a-4513-acef-dc254af57aac/files"/>
     <type>data</type>
     <master>false</master>
     <storage>
     <type>nfs</type>
     <address>192.168.0.10</address>
     <path>/data1</path>
     </storage>
     <available>175019917312</available>
     <used>27917287424</used>
     <committed>10737418240</committed>
     <storage_format>v1</storage_format>
     <host id="0656f432-923a-11e0-ad20-5254004ac988"
     href="/api/hosts/0656f432-923a-11e0-ad20-5254004ac988">
    </storage_domain>

            

