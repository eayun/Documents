# 关闭 SPICE 代理

以下介绍了如果关闭一个 SPICE 代理。

**关闭 SPICE 代理**

1. 登录到 EayunOS Manager：

```
    # ssh root@[IP of Manager]
```

2. 运行以下命令来删除 SPICE 代理：

```
	# engine-config -s SpiceProxyDefault=""
```

3. 重新启动 EayunOS Manager：

```
	# service ovirt-engine restart
```
	
SPICE 代理被关闭，用户将无法通过 SPICE 代理对 Red Hat Enterprise Virtualization 网络进行访问。
