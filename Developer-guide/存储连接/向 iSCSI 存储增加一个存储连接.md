# 向 iSCSI 存储增加一个存储连接

向 iSCSI 存储增加一个存储连接需要 *POST* 请求。

                
    POST /api/storagedomains/iSCSI_Domain_ID/storageconnections HTTP/1.1
    Accept: application/xml
    Content-type: application/xml

    <storage_connection id="Storage_Connection_ID">
    </storage_connection>

              
