# 打开 SPICE 代理

以下介绍了激活（打开）SPICE 代理的方法。

**激活 SPICE 代理**

1. 在 EayunOS Manager 中，使用 engine-config 工具设置一个代理：

```
    # engine-config -s SpiceProxyDefault=someProxy
```

2. 重新启动 ovirt-engine 服务：

```
	# service ovirt-engine restart
```
	
   代理必须使用以下格式来代表：
   
```   
	protocol://[host]:[port]
```   

> **注意**

> SPICE 客户端只支持 HTTP。如果使用 HTTPS，客户端将会忽略代理的设置，而尝试直接和 hypervisor 进行连接。

SPICE 代理被激活（打开）。现在可以通过 SPICE 代理对 EayunOS Virtualization 网络进行访问。