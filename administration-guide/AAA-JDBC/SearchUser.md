# 查找用户

以下命令显示所有存在用户：

    ovirt-aaa-jdbc-tool query --what=user

要缩小查询结果可以使用以下的用户属性：

* department

* description

* displayName

* email

* firstName

* id

* lastName

* name

* title

例如以下命令查询用户名以**j**开头的用户：

    ovirt-aaa-jdbc-tool query --what=user --pattern="name=j*"


