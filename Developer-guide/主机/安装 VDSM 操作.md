# 安装 VDSM 操作

在主机上安装 VDSM 以及相关的软件。主机类型定义了需要额外增加的参数。

-   *OVIRT企业化 Linux 主机* - 该主机类型需要一个 *root\_password*
    元素来索引到主机的 *root* 用户的密码。

-   *OVIRTNODE* - 该主机类型需要一个 *image*
    元素来索引到一个存储在OVIRTMANAGER服务器上的 ISO 文件。

<!-- -->

                
    POST /api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/install HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <action>
     <root_password>p@55w0Rd!</root_password>
    </action>

              

                
    POST /api/hosts/2ab5e1da-b726-4274-bbf7-0a42b16a0fc3/install HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <action>
     <image>/usr/share/rhev-hypervisor/rhev-hypervisor.iso</image>
    </action>

              
