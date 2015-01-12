# 虚拟机创建事件的XML描述

在虚拟机创建时，事件本身会抛出很多的信息（xml元素表示），不仅仅是用户的信息，
甚至是其它各元素之间的关系看下面的实例：


    <event href="/api/events/462" id="462">
    <description>VM Fedora-20-x86_64 was created by admin@internal.</description>
    <code>34</code>
    <severity>normal</severity>
    <time>2014-06-18T06:00:22.257+08:00</time>
    <correlation_id>1418eccf</correlation_id>
    <user href="/api/users/fdfc627c-d875-11e0-90f0-83df133b58cc" id="fdfc627c-d875-11e0-90f0-83df133b58cc"/>
    <vm href="/api/vms/ef8f840a-7c9d-49cb-b68a-ccc10d263964" id="ef8f840a-7c9d-49cb-b68a-ccc10d263964"/>
    <storage_domain href="/api/storagedomains/9171766d-5e29-46a6-8aa9-1e02f744b78b" id="9171766d-5e29-46a6-8aa9-1e02f744b78b"/>
    <cluster href="/api/clusters/b7b63d69-916d-4a87-8e78-7a164f1c976f" id="b7b63d69-916d-4a87-8e78-7a164f1c976f"/>
    <data_center href="/api/datacenters/14b39798-b32b-4f1b-a326-2e44f4a1af8c" id="14b39798-b32b-4f1b-a326-2e44f4a1af8c"/>
    <origin>oVirt</origin>
    <custom_id>-1</custom_id>
    <flood_rate>30</flood_rate>
    </event>

             

此例可以看到虚拟机与集群、存储域等之间的关系。

