# 主机集群的 XML 展现

              
    <cluster id="99408929-82cf-4dc7-a532-9d998063fa95"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95">
     <name>Default</name>
     <description>The default server cluster</description>
     <link rel="glustervolumes"
     href="/api/clusters/99408929-82cf-4dc7-a532-
    9d998063fa95/glustervolumes"/>
     <link rel="networks"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95/networks"/>
     <link rel="permissions"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95/permissions"/>
     <cpu id="Intel Penryn Family"/>
     <data_center id="01a45ff0-915a-11e0-8b87-5254004ac988"
     href="/api/datacenters/01a45ff0-915a-11e0-8b87-5254004ac988"/>
     <memory_policy>
     <overcommit percent="100"/>
     <transparent_hugepages>
     <enabled>false</enabled>
     </transparent_hugepages>
     </memory_policy>
     <scheduling_policies>
     <policy>evenly_distributed</policy>
     <thresholds low="10" high="75" duration="120"/>
     </scheduling_policies>
     <version minor="0" major="3"/>
     <supported_versions>
     <version minor="0"<usage> major="3"/>
     </supported_versions>
     <error_handling>
     <on_error>migrate</on_error>
     </error_handling>
     <virt_service>true</virt_service>
     <gluster_service>false</gluster_service>
    </cluster>

            

