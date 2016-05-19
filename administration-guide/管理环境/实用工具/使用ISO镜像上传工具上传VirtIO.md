# 使用 ISO 镜像上传工具上传 VirtIO

下面的示例将 virtio-win.iso、virtio-win.vfs 上传到 ISODomain 中。

**上传 VirtIO 和 Guest Tool 镜像文件**

```
    # engine-iso-uploader --iso-domain=[ISODomain] upload \
    /usr/share/virtio-win/virtio-win-0.1-74.iso \
    /usr/share/virtio-win/virtio-win-drivers-20120712-1.vfd
```

