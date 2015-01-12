# 主机的 iSCSI 发现操作

*iscsidiscover* 操作能让 iSCSI 端口查询出其中的 LUN 列表。

                
    POST /api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/iscsidiscover HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    <action>
     <iscsi>
     <address>mysan.example.com</address>
     <port>3260<port>
     </iscsi>
    </action>

              
