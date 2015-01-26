# 在 Linux 机器上安装 Remote Viewer

Remote Viewer 是一个连接到虚拟机终端的应用程序。它是一个 SPICE 客户端。


**在 Linux 机器上安装 Remote Viewer**

1. 运行如下命令来安装 spice-xpi 软件包与依赖。

   ``` 
   # yum install spice-xpi
   ``` 

2. 运行如下命令来检测 **virt-viewer** 软件包是否已经安装。

   ``` 
   # rpm -q virt-viewer
   virt-viewer-0.5.2-18.el6_4.2.x86_64
   ``` 
   如果 virt-viewer 软件包没有安装，运行如下命令来安装 virt-viewer 软件包与依赖。

   ``` 
   # yum install virt-viewer
   ``` 

3. 重启你的火狐浏览器来使变更生效。

SPICE 插件已经安装，你现在可以使用 SPICE 协议来连接虚拟机了。
