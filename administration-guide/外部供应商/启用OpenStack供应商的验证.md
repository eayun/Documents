### 介绍

在您可以访问 OpenStack 供应商所提供的资源前,您需要在 EayunOS虚拟化管理中心 中指定供应商的 Keystone 端点(endpoint)来启用这个服务器的验证机制。

### 配置一个 Keystone 端点的位置

1. 使用 root 用户登录到运行 EayunOS虚拟化管理中心 的系统上。
2. 运行以下命令配置 Keystone 服务器的位置(包括端口号和 API 版本):

           # engine-config --set KeystoneAuthUrl=http://[address to theendpoint]:35357/v2.0

3. 运行以下命令把 EayunOS 设置为只为所需的网据进行虚拟机调度:

           # engine-config --set OnlyRequiredNetworksMandatoryForVdsSelection=true

4. 重新启动引擎服务:

           # service ovirt-engine restart

### 结果

您配置了 OpenStack 供应商验证所需要的 Keystone 端点的位置。

>**注意**
>
>当前,EayunOS 只能指定 Keystone 端点。因此,只有那些使用 Keystone 端点进行验证的OpenStack 供应商才可以被访问。
