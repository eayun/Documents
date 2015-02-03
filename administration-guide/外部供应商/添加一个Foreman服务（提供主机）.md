# 添加一个 Foreman 服务(提供主机)

**概述**<br/>
为 EayunOS 添加一个 Foreman 服务。

**添加一个 Foreman 服务(提供主机)**

1. 在树型框中选择**外部提供商** 。

2. 点**添加**打开**添加服务商**窗口。

 ![The Add Provider Window Foreman](../images/External_Providers_the_add_provider_window_foreman.png)

 **添加服务商窗口**

3. 输入**名称**和**描述** 。

4. 在**类型**项中选 **Foreman**。

5. 在**供应商URL**项中输入 Foreman 所在机器的 URL 或全称域名(FQDN)。您不需要指定端口号。

6. 为 Foreman 输入**用户名**和**密码**。您在这里必须使用和登录到 Foreman provisioning portal 相同的用户名和密码。

7. 测试用户身份验证信息:

  1. 点**测试** 按钮来测试您所使用的验证信息是否有效。

  2. 如果 Foreman 使用SSL,**导入供应商证书**窗口会出现。点**确定**导入 Foreman 提供的证书。

  >**重要**
  >
  >在导入 Foreman 所提供的证书后,EayunOS 才可以和它进行通信。

8. 点**确定** 。

**结果**<br/>
您为 EayunOS 添加了 Foreman 服务,并可以使用 Foreman 所提供的主机。
