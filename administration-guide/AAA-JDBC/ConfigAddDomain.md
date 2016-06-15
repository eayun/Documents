# 配置添加附加域

**注意**：最新最先进的配置文档是ovirt-engine-extension-aaa-jdbc包中的README.admin文件。

以下步骤是使用aaa-jdbc扩展应用配置一个新的用户配置文件：

  1. 为aaa-jdbc扩展应用设置数据库

     请用实际内容将DB_NAME，DB_USER，DB_PASSWORD替换掉：
	```
	su - postgres -c "psql -d template1 << __EOF__
	create user DB_USER password 'DB_PASSWORD';
	create database DB_NAME owner DB_USER template template0
	encoding 'UTF8' lc_collate 'en_US.UTF-8' lc_ctype 'en_US.UTF-8';
	__EOF__
	"
	```

  2. 配置PostgreSQL数据库

     请添加如下内容到/var/lib/pgsql/data/pg_hba.conf文件中（请用实际内容替换DB_NAME和DB_USER）：

	```
	host    DB_NAME    DB_USER    0.0.0.0/0       md5
	host    DB_NAME    DB_USER    ::0/0           md5
	```

     以上内容必须添加在以下内容之前：

	```
	host    all        all        127.0.0.1/32    ident
	host    all        all        ::1/128         ident
	```

     添加完成之后重启数据库服务。

  3. 为AAA-JDBC扩展应用填充数据库

     请用实际内容将DB_HOST，DB_NAME，DB_USER，DB_PASSWORD替换掉：

	```
	PGPASSWORD="DB_PASSWORD" \
	    /usr/share/ovirt-engine-extension-aaa-jdbc/dbscripts/schema.sh
	\
	    -s DB_HOST \
	    -p DB_PORT \
	    -d DB_NAME \
	    -u DB_USER \
	    -c apply
	```

  4. 设置AAA配置用户文件

     为你的用户配置文件选择名字（这是名字在用户登录期间是可见的）和复制示例配置文件同时重命名你的用户配置文件（用你所选择的名字替换文件中的PROFILE）：

	```
	cp /usr/share/ovirt-engine-extension-aaa-jdbc/examples/extensio
	n.d/authn.properties \
	    /etc/ovirt-engine/extensions.d/PROFILE-authn.properties
	cp /usr/share/ovirt-engine-extension-aaa-jdbc/examples/extensio
	n.d/authz.properties \
	    /etc/ovirt-engine/extensions.d/PROFILE-authz.properties
	cp /usr/share/ovirt-engine-extension-aaa-jdbc/examples/aaa/profil
	e.properties \
	    /etc/ovirt-engine/aaa/PROFILE.properties
	```

     编辑所有拷贝过去的文件并用实际内容替换所有被@符号围绕的内容。

  5. 重新启动ovirt-engine服务同时查看一下/var/log/ovirt-engine/engine.log文件看看扩展应用是否根据配置用户文件成功初始化。

  6. 设置用户和用户组

     使用ovirt-aaa-jdbc-tool工具设置你的用户和用户组同时使用命令行选项--db-config指定数据库：

	```
	ovirt-aaa-jdbc-tool \
	    --db-config=/etc/ovirt-engine/aaa/PROFILE.properties \
	    OPTIONS
	```

  7. 使用现有的的管理员账户登录管理平台同时为配置用户文件中添加的用户和用户组分配所需的权限。

	
