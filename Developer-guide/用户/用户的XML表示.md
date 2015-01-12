# 用户的XML表示

                        
    GET /api/users HTTP/1.1
    Accept: application/xml
    <user id="225f15cd-e891-434d-8262-a66808fcb9b1"
    href="/api/users/225f15cd-e891-434d-8262-a66808fcb9b1">
    <name>RHEV-M Admin</name>
    <actions/>
    <link rel="roles"
    href="/api/users/225f15cd-e891-434d-8262-a66808fcb9b1/roles"/>
    <link rel="tags"
    href="/api/users/225f15cd-e891-434d-8262-a66808fcb9b1/tags"/>
    <domain>domain.example.com</domain>
    <logged_in>false</logged_in>
    <user_name>rhevmadmin@domain.example.com</user_name>
    <groups>
    <group>Group Policy Creator Owners@domain.example.com/Users</group>
    <group>Domain Admins@domain.example.com/Users</group>
    <group>Enterprise Admins@domain.example.com/Users</group>
    <group>Schema Admins@domain.example.com/Users</group>
    <group>Administrators@domain.example.com/Builtin</group>
    </groups>
    </user>
                        
                    

