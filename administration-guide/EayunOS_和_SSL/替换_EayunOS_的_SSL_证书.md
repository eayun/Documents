# 替换 EayunOS 企业级虚拟化管理平台的 SSL 证书

**介绍**<br/>
您希望使用您所在组织的经过商业签名的证书来向使用 https
进行连接的用户认证您的 EayunOS 企业级虚拟化管理平台。

> **注意**
>
> 为 https
> 连接使用商业分发的证书并不会影响用以进行 Manager 和主机之间进行验证的证书，它们之间将会继续使用 Manager 生成的自签名证书。

**前提需求**<br/>
此过程要求从您的商业证书分发机构处获得一个 PEM 格式化的证书、一个 .nokey
文件和一个 .cer 文件。.nokey 和 .cer 文件有时候使用 P12
格式作为一个证书密钥包进行分发。

此过程假设您有一个使用 P12 格式的证书密钥包。


**替换 EayunOS 企业级虚拟化管理平台的 Apache SSL 证书**

1. MANAGER 被配置为使用 **/etc/pki/ovirt-engine/apache-ca.pem**，其是一个指向
**/etc/pki/ovirt-engine/ca.pem** 的软链接。删除该软链接。

   ```
   # rm /etc/pki/ovirt-engine/apache-ca.pem
   ```

2. 将您的商业分发的证书保存为 **/etc/pki/ovirt-engine/apache-ca.pem**。

   ```
   # mv  /etc/pki/ovirt-engine/apache.pem
   ```

3. 将您的 P12 包复制至 **/etc/pki/ovirt-engine/keys/apache.p12**。

4. 从该包中提取出密钥。

   ```
   # openssl pkcs12 -in /etc/pki/ovirt-engine/keys/apache.p12 -nocerts -nodes > /etc/pki/ovirt-engine/keys/apache.key.nopass
   ```

5. 从该包中提取出证书。

   ```
   # openssl pkcs12 -in /etc/pki/ovirt-engine/keys/apache.p12 -nokeys > /etc/pki/ovirt-engine/certs/apache.cer
   ```

6. 重启 Apache 服务器。

   ```
   # service httpd restart
   ```

**结果**<br/>
您现在连接到门户的时候，不会再被警告注意用以加密 https
连接的证书的真实性了。

