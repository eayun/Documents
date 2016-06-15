# engine-iso-uploader 命令行参数说明

engine-iso-uploader 的基本使用方法如下：

```
    engine-iso-uploader [options] list
    engine-image-uploader [options] upload [file].[file]...[file]
```

两种操作模式：***list*** 和 ***upload***。

* ***list*** 操作会列出 EayunOS 虚拟化管理中心中可用的ISO存储域。

* ***upload*** 操作会上传 ISO 镜像文件（可以是多个，多个 ISO 镜像文件之间使用空格分隔）到指定的 ISO 存储域。默认通过 NFS 共享目录上传，也支持使用 SSH 上传。

ISO 镜像上传工具必须指定 ***list*** 或者 ***upload*** 其中一项操作，使用 ***upload*** 操作时，最少需要提供一个待上传镜像文件的路径。

**engine-iso-uploader** 提供了一些参数对命令的行为进行控制。

**常规选项**

***--version***

  显示命令版本信息。

***-h, --help***

  显示命令帮助信息。

***--conf-file=[PATH]***

  指定所使用的配置文件。默认使用的配置文件是 **/etc/ovirt-engine/isouploader.conf**。

***--log-file=[PATH]***

  指定输出的日志文件的路径。默认输出的日志文件是 **/var/log/ovirt-engine/ovirt-iso-uploader/ovirt-iso-uploader[date].log**。

***--cert-file=[PATH]***

  指定验证 engine 的证书。默认证书是 **/etc/pki/ovirt-engine/ca.pem**。

***--insecure***

  指定不要尝试验证。

***--nossl***

  指定不要使用 SSL 来连接到 Manager。

***--quiet***

  启用该选项之后,将命令的输出减少到最少。该选项默认是不启用的。

***-v, --verbose***

  启用该选项之后,命令将输出尽可能详细的信息。该选项默认是不启用的。

***-f, --force***

  当目标存储域中已经存在一个和将要上传的文件名字相同，则必须使用强制模式。默认开启该选项。

**EayunOS 虚拟化管理中心**

***-u [USER], --user=[USER]***

  指定上传文件时使用的用户名。用户名的格式为：[username]@[domain]。同时用户必须在 EayunOS 虚拟化管理中心中已经存在。

***-r [FQDN], --engine=[FQDN]***

  指定目标 EayunOS 虚拟化管理中心服务器的 FQDN 域名。默认是 **localhost**，即运行该命令的服务器和 EayunOS 虚拟化管理中心是同一台服务器。

**ISO 存储域选项**

指定 ISO 镜像文件上传的目标 ISO 存储域，下面的2个选项互斥，不能同时使用。

***-i, --iso-domain=[ISODOMAIN]***

  指定 ISO 镜像文件上传的目标 ISO 存储域。

***-n, --nfs-server=[NFSSERVER]***

  指定 ISO 镜像文件上传的目标 NFS 共享目录。

**连接选项**

ISO 镜像上传工具默认使用 NFS 共享上传文件，使用下面的选项可以切换为使用 SSH 连接上传。

***--ssh-user=[USER]***

  指定上传使用的 SSH 用户。

***--ssh-port=[PORT]***

  指定远端服务器的 SSH 监听端口。

***-k [KEYFILE], --key-file=[KEYFILE]***

  指定 SSH 连接的公钥文件。不使用公钥验证时，会提示输入指定 SSH 用户的密码。
