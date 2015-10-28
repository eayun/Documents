# 密码管理

以下命令以交互的形式为用户jdoe设置密码：

    ovirt-aaa-jdbc-tool user password-reset jdoe

设置密码支持以下几种形式的选项：

* **interactive**：工具会提示输入密码

* **pass**：以字符串的形式在命令行中指定的密码

* **env**：密码由**env**环境变量指定

* **file**：密码是从指定的文件中读取

* **none**：密码设置为空

**敬告**：通常规定密码在设置完成的同一时刻过期。以下命令是设置新的密码并且新的密码的有效期至2025年8月15号10点30分00秒：

    ovirt-aaa-jdbc-tool user password-reset jdoe --password-valid-to="2025-0
    8-15 10:30:00Z"

