# 兼容POSIX的存储域

EayunOS系统支持POSIX（native）文件系统作为存储域。POSIX文件系统的挂载支持大部分命令行手动挂载文件系统的常规选项。这个功能使得不用NFS，ISCSI和FCP就可以访问存储。

在EayunOS系统中，任何兼容POSIX的存储域必须支持稀疏文件和 direct I/O。例如：CIFS不支持direct I/O，所以不能在EayunOS系统中使用。

< *重点*
<
< 通常情况下会直接创建一个NFS存储域，而不是创建一个兼容POSIX的存储域来挂载NFS存储域。

