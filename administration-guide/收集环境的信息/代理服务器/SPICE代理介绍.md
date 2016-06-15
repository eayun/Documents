# SPICE 代理（SPICE Proxy）介绍

**概述**

SPICE 代理是一个当 SPICE 客户端位于 hypervisor 所在的网络之外时，把 SPICE 客户端和虚拟机进行连接的工具。设置 SPICE 代理的过程包括在机器上安装 Squid、配置 iptables 来允许使用代理的网络数据通过防火墙。启用 SPICE 代理的操作包括在 Manager 上使用 engine-config 来把 SpiceProxyDefault 的值设为包括代理的名称和端口的值。关闭 SPICE 代理的操作包括在 Manager 上使用 engine-config 删除为 SpiceProxyDefault 所设置的值。

> **重要**

> SPICE 代理只支持独立的 SPICE 客户端，它不能被用来连接使用 SPICE HTML5 或 noVNC 的虚拟机。