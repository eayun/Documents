# 兼容POSIX的存储域

EayunOS 系统支持 POSIX （native）文件系统作为存储域。POSIX 文件系统的挂载支持大部分命令行手动挂载文件系统的常规选项。这个功能使得不用 NFS ， ISCSI 和 FCP 就可以访问存储。

在 EayunOS 系统中，任何兼容 POSIX 的存储域必须支持稀疏文件和 direct I/O 。例如： CIFS 不支持 direct I/O，所以不能在 EayunOS 系统中使用。

> **重要**
>
> 通常情况下会直接创建一个NFS存储域，而不是创建一个兼容 POSIX 的存储域来挂载 NFS 存储域。

