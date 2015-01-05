# 示例：附加 ISO 镜像到虚拟机

我们的示例虚拟机需要将启动设备设置为 CD-ROM 或者是 DVD ISO
镜像，用来为虚拟机安装操作系统。本示例使用了 CentOS 6 ISO
镜像作为安装软体。

ISO 镜像必须要在 *iso1* ISO
存储域中。OVIRT企业虚拟化平台提供了上传工具用来将 ISO
镜像上传至正确的位置并且有正确的用户权限。

一旦 ISO 文件上传完成，API 用户就可以在 ISO 存储域的 *files*
子集合下来浏览文件资源：

*请求：*

              
    GET /api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da/files HTTP/1.1
    Accept: application/xml

            

*cURL 命令：*

              
    # curl -X GET -H "Accept: application/xml" -u [USER:PASS] --cacert [CERT] \
     https://[EayunOS Host]:443/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-
    3c898fa8b6da/files

            

API 返回如下的 files 子资源集的展现：

              
    <files>
     <file id="CentOS-6.5-x86_64-dvd.iso"
     href="/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da/
     files/CentOS-6.5-x86_64-dvd.iso.iso">
     <name>CentOS-6.5-x86_64-dvd.iso.iso</name>
     <storage_domain id="00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da"
     href="/api/storagedomains/00f0d9ce-da15-4b9e-9e3e-3c898fa8b6da"/>
     </file>
    </files>

            

一个 API 用户将 *CentOS-6.5-x86\_64-dvd.iso* 附加到我们的示例虚拟机中。

*请求：*

              
    POST /api/vms/6efc0cfa-8495-4a96-93e5-ee490328cf48/cdroms HTTP/1.1
    Accept: application/xml
    Content-type: application/xml
    <cdrom>
     <file id="CentOS-6.5-x86_64-dvd.iso"/>
    </cdrom>

            

*cURL 命令：*

              
    # curl -X POST -H "Accept: application/xml" -H "Content-Type: application/xml"
    \
     -u [USER:PASS] --cacert [CERT] \
     -d "<cdrom><file id='CentOS-6.5-x86_64-dvd.iso'/></cdrom>" \
     https://[EayunOS Host]:443/api/vms/6efc0cfa-8495-4a96-93e5-
    ee490328cf48/cdroms

            

