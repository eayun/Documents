# 主机的 iSCSI 登陆操作

*iscsilogin* 操作允许一台主机登陆一个 iSCSI 目标。登陆到一个目标让其中的
LUN 能够在 *host\_storage* 集合里显示。

                
    POST /api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/iscsilogin HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    <action>
     <iscsi>
     <address>mysan.example.com</address>
     <target>iqn.2009-08.com.example:mysan.foobar</target>
     <username>jimmy</username>
     <password>s3kr37</password>
     </iscsi>
    </action>

              
