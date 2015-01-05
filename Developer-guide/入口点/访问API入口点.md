# 访问API入口点

用户通过由host和base组成的入口点url发送一个GET方法的请求，以此开始和API进行交互。

如果*host*是*www.example.com*而且*base*是*/api*,入口切入点会伴随着以下请求出现：

             
     GET /api HTTP/1.1
     Accept: application/xml
     Host: www.example.com      
     Authorization: [base64 encoded credentials]

     HTTP/1.1 200 OK
     Content-Type: application/xml
     <api>
     <link rel="hosts" href="/api/hosts"/>
     <link rel="vms" href="/api/vms"/>
        ...
        <product_info>
           <name>EayunOS Enterprise Virtualization</name>
           <vendor>EayunOS</vendor>
           <version revision="0" build="0" minor="1" major="3"/>
        </product_info>    
        <special_objects>
           <link rel="templates/blank" href="..."/>
           <link rel="tags/root" href="..."/>
        </special_objects>
        <summary>
           <vms>
          <total>10</total>
          <active>3</active>
           </vms>
           <hosts>
          <total>2</total>
          <active>2</active>
           </hosts>
           <users>
          <total>8</total>
          <active>2</active>
           </users>
           <storage_domains>
          <total>2</total>
          <active>2</active>
           </storage_domains>
        </summary>
     </api>
             
             

> **Note**
>
> 为简单起见，所有其他的例子都忽略了*Host:*和*Authorization:*请求头并假设*base*是缺省的*/api*路径。这个基本的路经会因你实现的不同而不同。

