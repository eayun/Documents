# 为虚拟机配置qxl驱动

**介绍**<br/>
您可以通过图形界面或命令行来配置 qxl 驱动。执行以下操作中的一个。


**在 GNOME 中配置 qxl 驱动**

1. 点击**系统**。

2. 点击**管理**。

3. 点击**显示**。

4. 点击**硬件**。

5. 点击**显卡配置**。

6. 选择 **qxl**，点击 **OK**。

7. 重新登陆 X-Windows。


**在命令行中配置 qxl 驱动：**

1. 备份 **/etc/X11/xorg.conf** 文件：

    ```
    # cp /etc/X11/xorg.conf /etc/X11/xorg.conf.$$.backup
    ```

2. 在 **/etc/X11/xorg.conf** 文件的 Device 段中做以下修改：

    ```
    Section "Device"
    Identifier "Videocard0"
    Driver "qxl"
    Endsection
    ```

**结果**<br/>
qxl 驱动已经配置好，现在可以使用 SPICE 了。
