# EayunOS Manager 重命名工具的语法说明

**ovirt-engine-rename** 命令的基本语法为：

```
# /usr/share/ovirt-engine/setup/bin/ovirt-engine-rename
```

这个命令接受以下选项：

* **--newname=[new name]**
  允许指定 Manager 的新 FQDN 而不使用用户交互模式。
* ** --log=[file]
  允许指定路径和配置文件的文件名来加载重命名的操作。
* **--config-append=[file]**
  允许指定路径和配置文件的文件名来追加重命名的操作。这个选项可以指定路径和 answer 文件的名称。
* **--generate-answer=[file]**
  允许指定路径和所要回答的 answer 文件的名称，且被 **ovirt-engine-rename** 命令行所改变的值会被记录。

