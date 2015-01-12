# XML元素关系

XML元素的链接作为一个替代的子集来表示资源之间的关系。
XML元素链接是简单地用一个“href”属性指向的链接元素的元素。
XML元素的链接是用来模拟简单的资源之间的1：N映射，这种资源是独立的且没有与关系关联的数据。例如，一个主机和一个集群之间的关系。

这些关系的例子包括：

-   从在一个子集到父资源的资源的反向链接;或

-   具有任意关系，资源之间的链接。

<!-- -->

                
    GET /api/collection/resource_id/subcollection/subresource_id HTTP/1.1
    HTTP/1.1 200 OK
    Content-Type: application/xml
    <subcollection>
    <subresource id="subresource_id"
    href="/api/collection/resource_id/subcollection/subresource_id">
    <resource id="resource_id" href="/api/collection/resource_id"/>
    ...
    </subresource>
    </subcollection></subresource></subcollection>            
                
             
