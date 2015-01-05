# 示例：创建一个 NFS ISO 存储

一个 NFS ISO 存储是一个已经被挂载的且被附加到一个数据中心的 NFS
共享存储，它提供 DVD/CD-ROM ISO
文件和虚拟化的软盘镜像文件的存储。创建的新的存储需要一个 POST
请求，并且提供存储的描述信息，该请求发给存储资源集合的 URL。

*请求：*

              
    POST /api/storagedomains HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <storage_domain>
     <name>iso1</name>
     <type>iso</type>
     <storage>
     <type>nfs</type>
     <address>192.168.0.10</address>
     <path>/iso1</path>
     </storage>
     <host>
     <name>hypervisor</name>
     </host>
    </storage_domain>

            

*cURL 命令：*

              
    # curl -X POST -H "Accept: application/xml" -H "Content-Type: application/xml"
    \
     -u [USER:PASS] --cacert [CERT] \
     -d "<storage_domain><name>iso1</name><type>iso</type> \
     <storage><type>nfs</type><address>192.168.0.10</address> \
     <path>/iso1</path></storage> \
     <host><name>hypervisor</name></host></storage_domain>" \
     https://[EayunOS Host]:443/api/storagedomains

            

该 API 创建了一个名为 *iso1* 的 NFS iso 数据存储，且它的导出路径为
*192.168.0.10:/iso1*，并且通过NODE来设置到存储的连接。该 API
同时返回了新建的数据存储的如下资源展现。

*结果：*

              
    HTTP/1.1 200 OK
    Accept: application/xml
    <storage_domain id="00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da"
     href="/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da">
     <name>iso1</name>
     <link rel="permissions"
     href="/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da/
     permissions"/>
     <link rel="files"
     href="/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da/files"/>
     <type>iso</type>
     <host id="" href="">
     <master>false</master>
     <storage>
     <type>nfs</type>
     <address>192.168.0.10</address>
     <path>/iso1</path>
     </storage>
     <available>82678120448</available>
     <used>18253611008</used>
     <committed>0</committed>
     <storage_format>v1</storage_format>
     <host id="0656f432-923a-11e0-ad20-5254004ac988"
     href="/api/hosts/0656f432-923a-11e0-ad20-5254004ac988">
    </storage_domain>

            

