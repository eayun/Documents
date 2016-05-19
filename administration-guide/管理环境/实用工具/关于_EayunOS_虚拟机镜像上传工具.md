# 关于 EayunOS 虚拟机镜像上传工具

使用 **engine-image-uploader** 工具可以查看 export 存储域的列表，上传 OVF 格式的虚拟机镜像文件到指定 export 存储域。EayunOS 虚拟化管理中心能够识别和使用上传的虚拟机镜像。

> ##### 注意
> engine-image-uploader目前只支持在 EayunOS 虚拟化管理中心中导出的经过 gzip 压缩的虚拟机镜像。

使用虚拟机镜像上传工具极大地简化了分发虚拟机镜像的工作。

虚拟机镜像的格式包含以下内容：

```
    |-- images
    |   |-- [Image Group UUID]
    |        |--- [Image UUID (this is the disk image)]
    |        |--- [Image UUID (this is the disk image)].meta
    |-- master
    |   |---vms
    |       |--- [UUID]
    |             |--- [UUID].ovf
```
