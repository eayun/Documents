# 使用 engine-backup 命令创建备份

**概要**

以下描述的是直接使用 **engine-backup** 命令对 EayunOS 虚拟化管理中心的数据库和配置数据进行备份的过程，且能够在虚拟化管理中心正在使用的过程中进行。

**过程：备份 EayunOS 虚拟化管理中心**

1. 登录到运行 EayunOS 虚拟化管理中心的机器上。
1. 执行以下命令，创建一个完全备份：

  > ##### 示例：创建完全备份
  > `# engine-backup --scope=all --mode=backup --log=[file name] --file=[file name]`

  您也可以选择执行以下命令，仅仅备份 engine 数据库：

  > ##### 示例：创建 engine 数据库备份
  > `# engine-backup --scope=db --mode=backup --log=[file name] --file=[file name]`

**结果**

将生成一个 EayunOS 虚拟化管理中心的 tar 备份文件，这个文件包含 engine 数据库或 engine 数据库以及配置数据，这个备份文件以所指定的文件名称存放在指定的文件路径中。

