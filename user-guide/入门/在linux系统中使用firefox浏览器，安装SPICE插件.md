# 在linux系统中使用firefox浏览器，安装SPICE插件

SPICE插件是需要运行remote-viewer打开一个连接虚拟机的图形控制界面。remote-viewer是一个virt-viewer包提供的SPICE客户端。

1.  打开终端，root用户运行以下命令：

                                    #yum install spice-xpi
                                

2.  检查您的系统内是否安装virt-viewer包。

                                    #rpm -q virt-viewer
                                    virt-viewer-0.5.2-18.e16_4.2.x86_64
                                    
                                

    如果您已经安装了，运行以下命令：

                                    #yum install virt-viewer
                                

3.  重启Mozilla Firefox浏览器。

4.  SPICE插件已经安装完成，现在您可以连接您的虚拟机。

