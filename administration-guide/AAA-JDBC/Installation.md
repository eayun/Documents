# 安装

此扩展存储在**ovirt-engine-extension-aaa-jdbc**软件包中。首先你必须先安装软件包然后重新运行**ebgine-setup**命令：

	# dnf install ovirt-engine-extension-aaa-jdbc
	# engine-setup

**engine-setup**将创建所需的数据库架构，并且将已存在的管理员用户转移的创建的数据库架构中，最终实现配置工具**ovirt-aaa-jdbc-tool**的配置。
