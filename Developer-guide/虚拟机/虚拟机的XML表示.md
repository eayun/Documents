# 虚拟机的XML表示

              
    <vm id="082c794b-771f-452f-83c9-b2b5a19c0399"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399">
    <name>vm1</name>
    <description>Virtual Machine 1</description>
    <actions>
    <link rel="start"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/start"/>
    <link rel="stop"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/stop"/>
    <link rel="shutdown"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/shutdown"/>
    <link rel="suspend"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/suspend"/>
    <link rel="detach"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/detach"/>
    <link rel="migrate"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/migrate"/>
    <link rel="export"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/export"/>
    <link rel="import"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/import"/>
    <link rel="move"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/move"/>
    <link rel="ticket"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/ticket"/>
    </actions>
    <link rel="disks"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/disks"/>
    <link rel="nics"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/nics"/>
    <link rel="cdroms"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/cdroms"/>
    <link rel="snapshots"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/snapshots"/>
    <link rel="users"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/users"/>
    <link rel="tags"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/tags"/>
    <link rel="permissions"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/permissions"/>
    <link rel="statistics"
    href="/api/vms/082c794b-771f-452f-83c9-b2b5a19c0399/statistics"/>
    <type>desktop</type>
    <status>
    <state>up</state>
    </status>
    <memory>536870912</memory>
    <cpu>
    <topology cores="2" sockets="2"/>
    <cpu_tune>
    <vcpu_pin vcpu="0" cpu_set="1-4,^2"/>
    <vcpu_pin vcpu="1" cpu_set="0,1"/>
    <vcpu_pin vcpu="2" cpu_set="2,3"/>
    <vcpu_pin vcpu="3" cpu_set="0,4"/>
    </cpu_tune>
    <cpu_mode>host_passthrough</cpu_mode>
    </cpu>
    <os type="RHEL5">
    <boot dev="hd"/>
    <kernel/>
    177Red Hat Enterprise Virtualization 3.3 D eveloper Guide
    <initrd/>
    <cmdline/>
    </os>
    <highly_available>
    <enabled>true</enabled>
    <priority>20</priority>
    </highly_available>
    <display>
    <type>vnc</type>
    <port>5910</port>
    <monitors>1</monitors>
    <smartcard_enabled>true</smartcard_enabled>
    </display>
    <cluster id="99408929-82cf-4dc7-a532-9d998063fa95"
    href="/api/clusters/99408929-82cf-4dc7-a532-9d998063fa95"/>
    <template id="00000000-0000-0000-0000-000000000000"
    href="/api/templates/00000000-0000-0000-0000-000000000000"/>
    <start_time>2010-18-16T13:14:15</start_time>
    <creation_time>2010-08-16T14:24:29</creation_time>
    <origin>rhev</origin>
    <stateless>false</stateless>
    <placement_policy>
    <host id="2ab5e1da-b726-4274-bbf7-0a42b16a0fc3"/>
    <affinity>migratable</affinity>
    </placement_policy>
    <memory_policy>
    <guaranteed>536870912</guaranteed>
    </memory_policy>
    <usb>
    <enabled>true</enabled>
    </usb>
    <custom_properties>
    <custom_property value="124" name="sndbuf"/>
    </custom_properties>
    <guest_info>
    <ip address="192.168.0.25"/>
    </guest_info>
    <payloads>
    <payload type='cdrom'>
    <file name='/etc/hosts'>
    <content>
    127.0.0.1 localhost myvm.example.com
    </content>
    </file>
    </payload>
    </payloads>
    </vm>
              
            

