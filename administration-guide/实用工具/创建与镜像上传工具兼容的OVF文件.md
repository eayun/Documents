# 创建与镜像上传工具兼容的 OVF 文件

* **概要**

创建可以使用 **engine-image-uploader** 上传的 OVF 文件。

> ##### 过程：创建与镜像上传工具兼容的 OVF 文件

1. 在 Manager 中创建一个空 Export 存储域（空的 Export 存储域会更方便查看哪个目录包含了虚拟机）。
1. 将虚拟机导出到新创建的 Export 存储域。
1. 登录到 Export 存储域所在的实际服务器，找到 Export 存储域对应的NFS共享目录，该目录下应该有2个目录：**images/** 和 **master/**。
1. 执行以下命令：

```
    # tar -zcvf my.ovf images/ master/
```

  这个命令用于生成 OVF 的 tar/gzip 文件。

1. 使用生成的 OVF 文件即可在 EayunOS Manager 中恢复虚拟机。创建的 OVF 文件，可以通过 **engine-image-uploader** 命令上传到 EayunOS Manager 进行虚拟机导入。

* **结果**

  创建好了 OVF 文件的压缩包。任何人得到这个文件的人都可以使用 **engine-image-uploader** 命令将它上传到环境中。
