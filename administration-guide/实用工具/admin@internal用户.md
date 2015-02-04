# admin@internal用户

安装 EayunOS 虚拟化管理中心会自动创建*admin@internal*用户，用户信息保存在 EayunOS 虚拟化管理中心自身的数据库中，其他用户则需要从目录服务中添加。和外部目录服务的用户域不同，internal域无法增加、删除用户。*admin@internal*用户在 EayunOS 虚拟化管理中心中拥有SuperUser角色，具有管理权限。

*admin@internal*用户的密码在安装 EayunOS 虚拟化管理中心的过程中设置，修改密码需要使用*engine-config*命令。
