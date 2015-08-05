# 显卡设备穿透的注意事项

由于 EayunOS 企业级虚拟化宿主机的显示驱动在热绑定显卡设备时有问题，即在穿透了显卡设备的虚拟机关机后，显卡重新返还给主机时，主机的显示驱动无法再正常使用显卡设备，并可能导致系统错误。

为了解决此问题，将使用 pci-stub 驱动禁止显卡设备绑定到显示驱动上，将以 GeForce GTX 750 显卡为例，方法如下：

* 进入需要穿透显卡设备的宿主机命令行终端，执行如下命令：

  ```
  lspci
  ```

  在结果中寻找显卡设备信息，例如：

  ```
  01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750] (rev a2)
  01:00.1 Audio device: NVIDIA Corporation Device 0fbc (rev a1)
  ```

  记录下显卡设备的 pci 设备号：```01:00.0```和```01:00.1```，然后执行如下命令：

  ```
  lspci -n
  ```

  在结果中，通过上一步记录的 pci 设备号寻找显卡设备的 vendor id 和 device id 信息，例如：

  ```
  01:00.0 0300: 10de:1381 (rev a2)
  01:00.1 0403: 10de:0fbc (rev a1)
  ```

  记录下 ```10de:1381``` 和 ```10de:0fbc```

* 编辑```/etc/default/grub```文件，在```GRUB_CMDLINE_LINUX```开头的一行末尾，添加启动参数：

  ```
  pci-stub.ids=10de:1381,10de:0fbc
  ```

  配置文件的示例：

  ```
  GRUB_TIMEOUT=5
  GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
  GRUB_DEFAULT=saved
  GRUB_DISABLE_SUBMENU=true
  GRUB_TERMINAL_OUTPUT="console"
  GRUB_CMDLINE_LINUX="rd.lvm.lv=centos/swap vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos/root crashkernel=auto intel_iommu=on pci-stub.ids=10de:1381,10de:0fbc vconsole.keymap=us rhgb quiet"
  GRUB_DISABLE_RECOVERY="true"
  ```

* 执行以下命令，应用 grub 配置：

  ```
  grub2-mkconfig -o /boot/grub2/grub.cfg
  ```

* 重新启动宿主机，以使 pci-stub 驱动生效
