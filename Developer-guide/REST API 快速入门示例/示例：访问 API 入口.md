# 示例：访问 API 入口

下面的请求代码会获得 API 入口的展示。

*请求：*

    GET /api HTTP/1.1
    Accept: application/xml
          

*cURL 命令：*

    # curl -X GET -H "Accept: application/xml" -u [USER:PASS] \
     --cacert [CERT] https://[EayunOS Host]:443/api
          

*结果：*

              
    HTTP/1.1 200 OK
    Content-Type: application/xml
    <api>
     <link rel="capabilities" href="/api/capabilities"/>
     <link rel="clusters" href="/api/clusters"/>
     <link rel="clusters/search" href="/api/clusters?search={query}"/>
     <link rel="datacenters" href="/api/datacenters"/>
     <link rel="datacenters/search" href="/api/datacenters?search={query}"/>
     <link rel="events" href="/api/events"/>
     <link rel="events/search" href="/api/events?search={query}"/>
     <link rel="hosts" href="/api/hosts"/>
     <link rel="hosts/search" href="/api/hosts?search={query}"/>
     <link rel="networks" href="/api/networks"/>
     <link rel="roles" href="/api/roles"/>
     <link rel="storagedomains" href="/api/storagedomains"/>
     <link rel="storagedomains/search" href="/api/storagedomains?
    search={query}"/>
     <link rel="tags" href="/api/tags"/>
     <link rel="templates" href="/api/templates"/>
     <link rel="templates/search" href="/api/templates?search={query}"/>
     <link rel="users" href="/api/users"/>
     <link rel="groups" href="/api/groups"/>
     <link rel="domains" href="/api/domains"/>
     <link rel="vmpools" href="/api/vmpools"/>
     <link rel="vmpools/search" href="/api/vmpools?search={query}"/>
     <link rel="vms" href="/api/vms"/>
     <link rel="vms/search" href="/api/vms?search={query}"/>
     <special_objects>
     <link rel="templates/blank"
     href="/api/templates/00000000-0000-0000-0000-000000000000"/>
     <link rel="tags/root"
     href="/api/tags/00000000-0000-0000-0000-000000000000"/>
     </special_objects>
     <product_info>
     <name>Red Hat Enterprise Virtualization</name>
     <vendor>Red Hat</vendor>
     <version revision="0" build="0" minor="0" major="3"/>
     </product_info>
     <summary>
     <vms>
     <total>5</total>
     <active>0</active>
     </vms>
     <hosts>
     <total>1</total>
     <active>1</active>
     </hosts>
     <users>
     <total>1</total>
     <active>1</active>
     </users>
     <storage_domains>
     <total>2</total>
     <active>2</active>
     </storage_domains>
     </summary>
    </api>

            

入口提供给了用户一个获得虚拟化环境的资源列表的连接。每一个资源集链接的
*rel=* 属性都提供了其下属族源集的索引入口链接。本示例的下一步将检查
*数据中心* 资源集，它通过 *rel="datacenter"* 链接来实现访问。

API 的入口也包含了其它的资源集，如 *product\_info*，*special\_objects*
和 *summary*。有关这些资源的介绍将在其他章节中。

