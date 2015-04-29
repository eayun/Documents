# EayunOS 虚拟化管理中心客户端的软件要求

客户端通过 web 浏览器访问管理门户和普通用户门户。不同的操作系统平台上对 web 浏览器有不同的要求：

* 在 Red Hat 企业 Linux 上，使用 Mozilla Firefox 17 或者更新版本可以访问 2 种门户；
* 在微软 Windows 上，使用 IE 8 或者更新版本可以访问普通用户门户（只支持桌面版 IE，不可使用触屏版的 IE 10）。
* 在微软 Windows 上，使用 IE 9 或者更新版本可以访问管理门户（只支持桌面版 IE，不可使用触屏版的 IE 10）。

使用虚拟机控制台，需要安装 SPICE 客户端。支持安装 SPICE 客户端的系统有：

* Red Hat 企业 Linux 5.8+（i386、amd64、Intel64）
* Windows XP
* Windows XP Embedded (XPe)
* Windows 7 (x86, AMD64 and Intel 64)
* Windows 8 (x86, AMD64 and Intel 64)
* Windows Embedded Standard 7
* Windows 2008/R2 (x86, AMD64 and Intel 64)
* Windows Embedded Standard 2009

Mozilla Firefox 使用的 SPICE 客户端，需要通过 yum 安装 spice-xpi。

使用 IE 访问 2 种门户时，SPICE ActiveX 插件会自动下载安装。
