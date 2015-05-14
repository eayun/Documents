# 初始化 WGT 存储域

**摘要**

EayunOS Engine Appliance 初始化配置完成后，会默认创建一个 WGT_DOMAIN 的 ISO 存储域。
需要对其进行初始化以后，才能正常使用WGT_DOMAIN。

**初始化 WGT 存储域**

1. 以 engineadm 用户登录到 EayunOS 管理端，进入 Engine Console 界面。
2. 按下任意键进入主配置界面，在 Choose the advanced setting: 处输入【7】，并按下【Enter】键。
3. 进入高级配置界面，在 Choose the advanced setting: 处输入【4】，并按下【Enter】键。
4. 提示输入 admin@internal 的密码，则输入密码并按下【Enter】键。
5. 经过一系列自动的步骤之后，提示 WGT_DOMAIN initialization successfully. 则说明初始化成功。
6. 按下任意键退出初始化界面，回到主配置界面。

**结果**

WGT_DOMAIN 初始化成功。
