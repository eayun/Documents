# ISO 镜像上传工具基本使用示例

下面是 ISO 镜像上传工具的基本使用方法的示例。第一条命令列出了 EayunOS 虚拟化管理中心中可用的 ISO 存储域，使用的用户是 admin@internal。第二条命令通过 NFS 共享将 ISO 镜像文件上传到了指定的 ISO 存储域。

>**列出域并上传镜像**

>```
    # engine-iso-uploader list
    Please provide the REST API password for the admin@internal oVirt Engine user
    (CTRL+D to abort):
    ISO Storage Domain Name   | Datacenter                | ISO Domain Status
    ISO-DOMAIN                | Default                   | active
    ISO_DOMAIN                | iscsi                     | active
    ISO_DOMAIN                | local_datacenter          | active
```
```
    # engine-iso-uploader --iso-domain=[ISODomain] upload \
    [CentOS-6.5-x86_64.iso]
    Please provide the REST API password for the admin@internal oVirt Engine user
    (CTRL+D to abort):
```
