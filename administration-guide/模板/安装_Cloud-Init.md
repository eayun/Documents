# 安装 Cloud-Init
**概述**<br/>
在虚拟机上安装 Cloud-Init。

**安装 Cloud-Init**
 1. 登录到虚拟机。

 1. 启用 Red Hat Common 频道。

   - 使用 RHN Classic:

    ``` # rhn-channel   --add--channel=rhel-x86_64-server-rh-common-6```

   - 使用 Subscription Manager：

    ```    # subscription-manager repos  --enable=rhel-6-server-rh-common-rpms```

 1. 安装 cloud-init 软件包：

 ```    # yum install cloud-init```

**结果**<br/>
您安装了 cloud-init 软件包。
