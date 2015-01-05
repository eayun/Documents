# 主机的 XML 展现

              
    <host id="2ab5e1da-b726-4274-bbf7-0a42b16a0fc3"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3">
     <name>host1</name>
     <actions>
     <link rel="install"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/install"/>
     <link rel="activate"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/activate"/>
     <link rel="fence"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/fence"/>
     <link rel="deactivate"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/deactivate"/>
     <link rel="approve"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/approve"/>
     <link rel="iscsilogin"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-525400d75548/iscsilogin"/>
     <link rel="iscsidiscover"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-
    525400d75548/iscsidiscover"/>
     <link rel="commitnetconfig"
     href="/api/hosts/762f3276-9d1e-11e0-a27c-
    525400d75548/commitnetconfig"/>
     </actions>
     <link rel="storage"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/storage"/>
     <link rel="nics"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/nics"/>
     <link rel="tags"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/tags"/>
     <link rel="permissions"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/permissions"/>
     <link rel="statistics"
     href="/api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/statistics"/>
     <type>rhev-h</type>
     <address>host1.example.com</address>
     <status>
     <state>up</state>
     </status>
     <cluster id="99408929-82cf-4dc7-a532-9d998063fa95"
     href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95"/>
     <port>54321</port>
     <storage_manager priority="2">true</storage_manager>
     <power_management>
     <enabled>false</enabled>
     <options/>
     </power_management>
     <ksm>
     <enabled>true</enabled>
     </ksm>
     <transparent_hugepages>
     <enabled>true</enabled>
     </transparent_hugepages>
     <iscsi>
     <initiator>iqn.2001-04.com.example:diskarrays-sn-a8675309</initiator>
     </iscsi>
     <cpu>
     <topology cores="2" sockets="1"/>
     <name>Intel(R) Core(TM)2 Duo CPU E8400 @ 3.00GHz</name>
     <speed>2993</speed>
     </cpu>
    Red Hat Enterprise Virtualization 3.3 Developer Guide
    170 <summary>
     <active>2</active>
     <migrating>0</migrating>
     <total>3</total>
     </summary>
     <version major="3" minor="0"/>
     <libvirt_version major="0" minor="10" build="2" revision="0" 
    full_version="libvirt-0.10.2-15.el6"/>
    </host>

            

