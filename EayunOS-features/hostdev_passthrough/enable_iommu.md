# 启用宿主机的 IOMMU 功能

主机设备的穿透功能需要宿主机开启对 IOMMU 的支持。默认情况为非开启的状态，要开启，执行以下步骤：

* 进入需要开启 IOMMU 功能的宿主机命令行终端
* 编辑```/etc/default/grub```文件，在```GRUB_CMDLINE_LINUX```开头的一行末尾，添加启动参数：
  * 若宿主机为 intel 的 cpu，添加启动参数为```intel_iommu=on```
  * 若宿主机为 amd 的 cpu，添加启动参数为```amd_iommu=on```

  例如，对 intel 的 cpu，配置文件的示例：

  ```
  GRUB_TIMEOUT=5
  GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
  GRUB_DEFAULT=saved
  GRUB_DISABLE_SUBMENU=true
  GRUB_TERMINAL_OUTPUT="console"
  GRUB_CMDLINE_LINUX="rd.lvm.lv=centos/swap vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos/root crashkernel=auto intel_iommu=on vconsole.keymap=us rhgb quiet"
  GRUB_DISABLE_RECOVERY="true"
  ```

* 执行以下命令，应用 grub 配置：

  ```
  grub2-mkconfig -o /boot/grub2/grub.cfg
  ```

* 重新启动宿主机，以使 IOMMU 生效
