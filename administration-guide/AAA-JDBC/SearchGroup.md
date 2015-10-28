# 查找用户组

以下命令显示所有已存在的用户组：

    ovirt-aaa-jdbc-tool query --what=group

为了缩小查询结果可以使用以下的用户组属性：

* description

* displayName

* name

例如如下命令为查询用户组名以**gr**开头的用户组：

    ovirt-aaa-jdbc-tool query --what=group --pattern="name=gr*"


