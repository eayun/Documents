# 为虚拟机配置键盘和鼠标,以使SPICE可工作

**总结**<br/>
编辑 **/etc/X11/xorg.conf**，来启动 spice 的 tablet 设备。


**配置一个虚拟机的平板输入设备和鼠标来使用 SPICE**

1. 确保 tablet 设备在系统中被识别出来。

    ```
    # /sbin/lsusb -v | grep 'QEMU USB Tablet'
    ```

    如果没有任何输出的话，没必要配置 tablet 设备了。

2. 备份 **/etc/X11/xorg.conf**：

    ```
    # cp /etc/X11/xorg.conf /etc/X11/xorg.conf.$$.backup
    ```

3. 修改 **/etc/X11/xorg.conf** 的相关内容为:。

    ```
    Section "ServerLayout"
    Identifier     "single head configuration"
    Screen      0  "Screen0" 0 0
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Tablet" "SendCoreEvents"
    InputDevice    "Mouse" "CorePointer"
    EndSect

    Section "InputDevice"
    Identifier  "Mouse"
    Driver      "void"
    #Option      "Device" "/dev/input/mice"
    #Option      "Emulate3Buttons" "yes"
    EndSection

    Section "InputDevice"
    Identifier  "Tablet"
    Driver      "evdev"
    Option      "Device" "/dev/input/event2"
    Option "CorePointer" "true"
    EndSection
    ```

4. 重新登陆 X-Windows。

**结果**<br/>
已经在虚拟机中启用了 tablet 设备了。
