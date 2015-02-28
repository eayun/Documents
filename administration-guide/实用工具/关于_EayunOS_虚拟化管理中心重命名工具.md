# 关于 EayunOS Manager 重命名工具

在初始环境下运行 **engine-setup** 命令，会根据安装过程中提供的 FQDN 域名生成一系列证书和密钥。如果后期需要修改 EayunOS 虚拟化管理中心的 FQDN 域名（例如，将 EayunOS 虚拟化管理中心 迁移到另一个网络环境），需要使用 **ovirt-engine-rename** 命令完成所有相关的调整。

**ovirt-engine-rename** 命令所更新的 FQDN 域名的相关文件的位置如下：

* /etc/ovirt-engine/engine.conf.d/10-setup-protocols.conf

* /etc/ovirt-engine/imageuploader.conf.d/10-engine-setup.conf

* /etc/ovirt-engine/isouploader.conf.d/10-engine-setup.conf

* /etc/ovirt-engine/logcollector.conf.d/10-engine-setup.conf

* /etc/pki/ovirt-engine/cert.conf

* /etc/pki/ovirt-engine/cert.template

* /etc/pki/ovirt-engine/certs/apache.cer

* /etc/pki/ovirt-engine/keys/apache.key.nopass

* /etc/pki/ovirt-engine/keys/apache.p12

> **警告**
>
> 当 **ovirt-engine-rename** 命令生成了一个运行 Manager 的 web 服务器证书时，它不会影响engine或权限的证书。由于这一点，使用 **ovirt-engine-rename** 的命令是有一定风险的，特别是从低版本升级到高版本的环境中风险更大。因此，如果可以的话，推荐使用 **engine-cleanup** 和 **engine-setup** 命令来重命名 Manager 的 FQDN 域名。

> **重要**
>
> 目前的 EayunOS 版本提供了 Console 界面，Manager 的 FQDN 更改可以通过 Console 界面进行，相对使用命令行工具要简单得多。因此，推荐使用 **Console 界面**进行操作。
