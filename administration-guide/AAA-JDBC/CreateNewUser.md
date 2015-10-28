# 创建新用户

	ovirt-aaa-jdbc-tool user add jdoe \
		--attribute=firstName=John \
		--attribute=lastName=Doe \
		--attribute=email=jdoe@unknown.com

只有用户名是必须填写的，其他的属性作为可选项。以下是用户可以指定的属性：

* department

* description

* displayName

* email

* firstName

* lastName

* title

**敬告**：在用户密码设置命令[pssword-reset](http://www.ovirt.org/Features/AAA_JDBC)执行之前用户是不能登录管理平台的。
