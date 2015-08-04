# 使用 Virt viewer 手动连接虚拟机控制台

0. 目标虚拟机设置为了spice连接的方式，且为运行状态

1. 在客户端配置好以主机名访问管理平台的方式，而非 ip 地址的方式

2. 下载管理平台的 ca 证书：
```
wget http://【管理平台主机名】/ovirt-engine/ca.crt
```

3. 获得虚拟机信息：
```
curl -X GET https://【管理平台主机名】/api/vms/?search=name%3D【要搜索的虚拟机名】 -u 【管理员用户名】@【域】:【用户的密码】 --cacert ca.crt
```
从结果中找到如下内容：
```
<vm href="/api/vms/【虚拟机id】" id="【虚拟机id】">
<host href="/api/hosts/【主机id】" id="【主机id】"/>
<address>【spice连接地址】</address>
<port>【spice连接端口】</port>
<secure_port>【spice连接安全端口】</secure_port>
```
并记录下【虚拟机id】、【主机id】、【spice连接地址】、【spice连接端口】和【spice连接安全端口】

4. 获得主机的 subject 信息：
```
curl -X GET https://【管理平台主机名】/api/hosts/【主机id】 -u 【管理员用户名】@【域】:【用户的密码】 --cacert ca.crt
```
在结果中获得如下内容：
```
<subject>【subject】</subject>
```
并记录下【subject】

5. 确认在客户端可以访问【spice连接地址】的主机

6. 设置 virt viewer 连接的 ticket：
```
curl -X POST https://【管理平台主机名】/api/vms/【虚拟机id】/ticket -u 【管理员用户名】@【域】:【用户的密码】 --cacert ca.crt -H "Content-Type: application/xml" -d '<action><ticket><expiry>120</expiry></ticket></action>'
```
在结果中获得如下内容：
```
<value>【ticket】</value>
```
并记录下【ticket】

7. 在上一步执行后120秒之内执行 remote viewer 命令：
```
remote-viewer --spice-ca-file ca.crt --spice-host-subject "【subject】" spice://【spice连接地址】/?port=【spice连接端口】\&tls-port=【spice连接安全端口】\&password=【ticket】
```
