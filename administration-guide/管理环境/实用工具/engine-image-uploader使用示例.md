# engine-image-uploader 使用示例

下面的示例使用 **engine-image-uploader** 列出存储域上传 OVF 文件：

**使用 engine-image-uploader 列出导出域**

```
    # engine-image-uplaoder list
    Please provide the REST API username for the admin@local oVirt Engine user:
    **********
    Export Storage Domain Name | Datacenter | Export Domain Status
    myexportdom                | Myowndc    | active
```

上传镜像文件时，需要指定 NFS 共享目录（-n 选项）或者 Export 存储域（-e 选项），以及需要上传的文件名：

**使用 engine-image-uploader 上传文件**

```
    # engine-image-uploader -e myexportdom upload my.ovf
    Please provide the REST API username for the admin@local oVirt Engine user:
    **********
```
