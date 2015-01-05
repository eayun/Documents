# OVIRT\_STORAGE卷子集

> **Important**
>
> 本节提的内容仅用于技术预览。

OVIRT虚拟化提供了一个途径来创建和管理OVIRT\_STORAGE。OVIRT\_STORAGE和主机集群相关联并且以
*glustervolumes* 子集来展现。

> **Important**
>
> 控制OVIRT企业虚拟化的卷需要OVIRT\_STORAGE 2.0

在 *glustervolumes* 子集中的OVIRT\_STORAGE资源通过下列元素来展现：

|元素|类别|描述|属性|
|----|----|----|----|
|*volume\_type*|枚举类型|定义了卷类别，要查看所有卷类别列表请参见 *capailities* 集合。|![](../images/exclamation.png) ![](../images/lock.png)|
|*bricks*|关系|OVIRT\_STORAGE块（brick）的子集。当创建一个新的卷时，创建的请求需要在该集群中创建和管理一系列 *brick* 元素。需要OVIRT\_STORAGE服务器的 *server\_id* 和块目录的 *brick\_dir* 元素。|![](../images/exclamation.png) ![](../images/lock.png)|
|*transport\_types*|复合体|定义了一系列的卷的 *transport\_type* 元素。*capailities* 集合展示了可用的 transport\_type。|![](../images/lock.png)|
|*replica\_count*|整数|定义了复制式的卷的文件复制计数|![](../images/lock.png)|
|*stripe\_count*|整数|定义条带卷（striped volume）的条带计数|![](../images/lock.png)|
|*options*|复合体|一系列OVIRT\_STORAGE*option* 元素。每一个 *option* 包括属性名 *name* 和属性值 *value*。|![](../images/lock.png)|

                  
    <gluster_volume id="99408929-82cf-4dc7-a532-9d998063fa95"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95
     /glustervolume/e199f877-900a-4e30-8114-8e3177f47651">
     <name>GlusterVolume1</name>
     <link rel="bricks"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95
     /glustervolume/e199f877-900a-4e30-8114-8e3177f47651/bricks"/>
     <volume_type>DISTRIBUTED_REPLICATE</volume_type>
     <transport_types>
     <transport_type>TCP</transport_type>
     </transport_types>
     <replica_count>2</replica_count>
     <stripe_count>1</stripe_count>
     <options>
     <option>
     <name>cluster.min-free-disk</name>
     <value>536870912</value>
     </option>
     </options> 
    </gluster_volume>

                

通过包含 *name*，*volume\_type* 和 *bricks* 的 POST
请求来对子集创建OVIRT\_STORAGE卷。

                  
    POST /api/clusters/99408929-82cf-4dc7-a532-9d998063fa95/glustervolumes HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    <gluster_volume>
     <name>GlusterVolume1</name>
     <volume_type>DISTRIBUTED_REPLICATE</volume_type>
     <bricks>
     <brick>
     <server_id>server1</server_id>
     <brick_dir>/exp1</brick_dir>
     </brick>
     <bricks>
    </gluster_volume>

                

通过 *DELETE* 请求来移除OVIRT\_STORAGE卷。

                  
    DELETE /api/clusters/99408929-82cf-4dc7-a532-
    9d998063fa95/glustervolumes/e199f877-900a-4e30-8114-8e3177f47651 HTTP/1.1
    HTTP/1.1 204 No Content

                

> **Important**
>
> *glustervolumes* 中的资源不能被更新。
