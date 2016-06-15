# 在 Manager 和一个 LDAP 服务器间设置 SSL 或 TLS 连接

要在 EayunOS Manager 和一个 LDAP 服务器间创建一个安全的连接，需要获得服务器的根（root）CA 证书。把它导入到 Manager 来创建一个公共 keystore 文件来保存信息。keystore 可以是 Java 支持的任何类型，以下操作使用 Java KeyStore (JKS) 格式。

获得 LDAP 服务器的根 CA 证书，把它复制到 Manager 的 /tmp 目录下。然后，使用以下流程在 Manager 上创建一个公共 keystore 文件。使用功能 keystore 文件的信息更新 LDAP 属性配置文件。

**创建一个 keystore 文件**

1. 在 EayunOS Manager 上，导入证书并创建一个公共 keystore 文件。以下命令会在 /tmp/myrootca.pem 导入根 CA 证书，并在 /etc/ovirt-engine/aaa/ 中创建一个公共 keystore 文件（myrootca.jks）。
	
```
$ keytool -importcert -noprompt -trustcacerts -alias myrootca -file /tmp/myrootca.pem -keystore /etc/ovirt-engine/aaa/myrootca.jks -storepass changeit
```
	
2. 使用 keystore 文件的信息更新 /etc/ovirt-engine/aaa/profile1.properties 文件。
	
>- **注意**

>- ${local:_basedir} 是 LDAP 属性配置文件所在的目录，它指向 /etc/ovirt-engine/aaa 目录。如果您在不同的目录中创建了公共 keystore 文件，使用到公共 keystore 文件的完全路径替换 ${local:_basedir}。
	
A. 使用 startTLS（推荐）：
	
```
# Create keystore, import certificate chain and uncomment
pool.default.ssl.startTLS = true
pool.default.ssl.truststore.file = ${local:_basedir}/myrootca.jks
pool.default.ssl.truststore.password = changeit
```

B. 使用 SSL：
	
```
# Create keystore, import certificate chain and uncomment
pool.default.serverset.single.port = 636
pool.default.ssl.enable = true
pool.default.ssl.truststore.file = ${local:_basedir}/myrootca.jks
pool.default.ssl.truststore.password = changeit
```