# 打开 SPICE 代理

以下介绍了激活（打开）SPICE 代理的方法。

**激活 SPICE 代理**

1. 在 EayunOS Manager 中，使用 engine-config 工具设置一个代理：

```
    # engine-config -s SpiceProxyDefault=someProxy
```

`someProxy格式 http://[host]:[port]`

`http://proxyname.example.com:3128`

**someProxy**指安装了squid 的地址，squid 是安装在管理平台上的，管理平台配置了SpiceProxyDefault后spice 客户端就会去 someProxy 连接spice 服务端.


2. 重新启动 ovirt-engine 服务：

```
	# service ovirt-engine restart
```
	

> **注意**

> SPICE 客户端只支持 HTTP。如果使用 HTTPS，客户端将会忽略代理的设置，而尝试直接和 hypervisor 进行连接。

SPICE 代理被激活（打开）。现在可以通过 SPICE 代理对 EayunOS Virtualization 网络进行访问。
