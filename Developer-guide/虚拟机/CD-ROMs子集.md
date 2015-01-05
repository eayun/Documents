# CD-ROMs子集

只读光盘子集描述了虚拟机上的CD-ROM设备。一个*cdrom*包含以下元素：

|元素|类型|描述|属性|
|----|----|----|----|
|file id=|字符串/文件名|关于ISO镜像||

                
    <cdrom id="00000000-0000-0000-0000-000000000000"
    href="/api/vms/cdc0b102-fbfe-444a-b9cb-57d2af94f401/cdroms/
    00000000-0000-0000-0000-000000000000">
    <file id="rhel-server-6.0-x86_64-dvd.iso"/>
    <vm id="cdc0b102-fbfe-444a-b9cb-57d2af94f401"
    href="/api/vms/cdc0b102-fbfe-444a-b9cb-57d2af94f401"/>
    </cdrom>
                
              

可以用*file id*元素发送*POST*请求来添加新的CD-ROM资源。

                
    POST /api/vms/cdc0b102-fbfe-444a-b9cb-57d2af94f401/cdroms/00000000-0000-0000-
    0000-000000000000 HTTP/1.1
    Accept: application/xml
    Content-type: application/xml

    <cdrom>
    <file id="fedora-15-x86_64-dvd.iso"/>
    </cdrom>
                
              

API用户可以使用*PUT*请求来更改CD-ROM。

                
    PUT /api/vms/cdc0b102-fbfe-444a-b9cb-57d2af94f401/cdroms/00000000-0000-0000-
    0000-000000000000 HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <cdrom>
    <file id="fedora-15-x86_64-dvd.iso"/>
    </cdrom>
                
              

API用户可以使用附加的*current* URL的*PUT*请求来更改当前阶段的CD-ROM。

                
    POST /api/vms/cdc0b102-fbfe-444a-b9cb-57d2af94f401/cdroms/00000000-0000-0000-
    0000-000000000000;current HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <cdrom>
    <file id="fedora-15-x86_64-dvd.iso"/>
    </cdrom>
                
              

> **Note**
>
> 一个虚拟机只能拥有一个CD-ROM设备。
