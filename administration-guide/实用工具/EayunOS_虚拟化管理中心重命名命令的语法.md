# EayunOS 虚拟化管理中心重命名命令的语法

**ovirt-engine-rename** 命令的基本语法是：

```# /usr/share/ovirt-engine/setup/bin/ovirt-engine-rename```

 这个命令还可以使用以下选项：

- ```--newname=[new name]```

   允许您以非交互模式指定 Manager 的新全局域名。

- ```--log=[file]```

   允许您指定一个文件的路径和文件名来记录重新命名操作产生的日志信息。

- ```--config=[file]```

     允许您指定一个配置文件的路径和文件名。这个配置文件会被重命名操作加载。

- ```--config-append=[file]```

     允许您指定一个配置文件的路径和文件名。这个配置文件可以被用来指定重命名操作所需的答案文件（answer file）的路径和文件名。

- ```--generate-answer=[file]```

     允许您指定一个文件的路径和文件名。这个文件可以被用来记录答案，以及 **ovirt-engine-rename** 命令所修改的值。
