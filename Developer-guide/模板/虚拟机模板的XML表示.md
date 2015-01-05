# 虚拟机模板的XML表示

                        
    <template id="00000000-0000-0000-0000-000000000000"
    href="/api/templates/00000000-0000-0000-0000-000000000000">
    <name>Blank</name>
    <description>Blank template</description>
    <actions>
    <link rel="export"
    href="/api/templates/00000000-0000-0000-0000-000000000000/export"/>
    </actions>
    <link rel="disks"
    href="/api/templates/00000000-0000-0000-0000-000000000000/disks"/>
    <link rel="nics"
    href="/api/templates/00000000-0000-0000-0000-000000000000/nics"/>
    <link rel="cdroms"
    href="/api/templates/00000000-0000-0000-0000-000000000000/cdroms"/>
    <link rel="permissions"
    href="/api/templates/00000000-0000-0000-0000-000000000000/permissions"/>
    <type>server</type>
    <status>
    <state>ok</state>
    </status>
    <memory>536870912</memory>
    <cpu>
    <topology cores="1" sockets="1"/>
    </cpu>
    <os>
    <boot dev="hd"/>
    <kernel/>
    <initrd/>
    <cmdline/>
    </os>
    <cluster id="99408929-82cf-4dc7-a532-9d998063fa95"
    href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95"/>
    <creation_time>2010-08-16T14:24:29</creation_time>
    <origin>rhev</origin>
    <highly_available>
    <enabled>true</enabled>
    <priority>100</priority>
    </highly_available>
    <display>
    <type>vnc</type>
    <port>5910</port>
    <monitors>1</monitors>
    </display>
    <stateless>false</stateless>
    <usb>
    <enabled>true</enabled>
    </usb>
    </template>
                        
                    

