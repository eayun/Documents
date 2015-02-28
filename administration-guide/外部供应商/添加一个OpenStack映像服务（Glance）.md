# 添加一个 OpenStack映像服务 (Glance)

**概述**<br/>
为 EayunOS 添加一个 OpenStack 映像服务(Glance)。

**添加一个OpenStack映像服务(Glance)**

1. 在树型框中选择外**部提供商**。

2. 点**添加**打开**添加服务商**窗口。
![The Add Provider Window Glance](../images/External_Providers_the_add_provider_window_glance.png)

3. 输入**名称**和**描述**。

4. 在**类型**项中选择 **OpenStack Image**。

5. 在**供应商 URL** 项中输入 Glance 所在机器的 URL 或全称域名(FQDN)。

6. 另外,可以选择**需要验证**后输入 Glance 的**用户名** 、**密码**和**Tenant名**。您必须使用与在 Keystone 中注册的 Glance 用户相同的用户名和密码,并且 Glance 的 tenant 是一个成员。

7. 测试用户身份验证信息:

  1. 点**测试**按钮来测试您所使用的验证信息是否有效。

  2. 如果 Glance 使用 SSL,**导入供应商证书**窗口会出现。点**确定**导入 Glance 提供的证书。

  > **重要**
  >
  > 在导入 Glance 所提供的证书后,EayunOS 才可以和它进行通信。

8. 点**确定**。

**结果**<br/>
您为 EayunOS 添加了 Glance 服务,并可以使用 Glance 所提供的映像。
