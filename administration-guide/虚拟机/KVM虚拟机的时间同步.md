# KVM虚拟机的时间同步

虚拟环境存在着虚拟机的时间管理问题。使用 Time Stamp Counter (TSC) 作为时间源的虚拟机可能会遇到一些与时间相关的问题，因为一些 CPU 并没有 constant TSC。那些没有正确时间管理的虚拟机可能会在使用一些网络应用程序时出现问题，因为您的虚拟机中的时间源可能会比实际的时间慢或快。

KVM 通过为虚拟机提供一个准虚拟化的时钟解决了这个问题。KVM pvclock 为 KVM 客户端系统提供了一个稳定的时间源。

当前，只有 CentOS 5.4 以及更高版本的虚拟机完全支持准虚拟化时钟。

使用不准确的时钟和计数器的虚拟机可能会有以下问题：

* 虚拟机的时钟和实际的时间不同步，导致无效的进程和网络操作。
* 虚拟机的时钟慢会导致迁移出现问题。

这些问题也会出现在其它虚拟化平台上，所有时间功能需要被测试。


> **重要**
>
> Network Time Protocol (NTP) 守护进程应该在主机和虚拟机上都运行。运行以下命令来启用 **ntpd** 服务：
>
> ```
> # service ntpd start
> ```
>
> 把 ntpd 服务添加到启动脚本中：
>
> ```
> # chkconfig ntpd on
> ```
>
> 使用 **ntpd** 服务可以减轻时钟不同步的问题。
>
> 您需要使用的 NTP 服务器必须可以正常工作，并可以被您的主机和虚拟机所访问。


**检查您的 CPU 是否有一个 constant TSC**

如果有 **constant_tsc** 标识，说明您的 CPU 有 constant TSC。运行以下命令来检查是否有 **constant_tsc** 标识：

```
$ cat /proc/cpuinfo | grep constant_tsc
```

如果以上命令有输出，说明您的 CPU 有 **constant_tsc**。如果没有输出，请进行以下步骤。

**配置没有 constant TSC 的主机**

没有 constant TSC 的系统需要额外的配置。电源管理功能会影响到时间的准确性，因此为了保证时间的准确，使用 KVM 的虚拟机应该禁用这个功能。


> **重要**
>
> 以下步骤只适用于 AMD revision F CPU。

如果 CPU 没有 **constant_tsc** 位，禁用所有的电源管理功能 (BZ#513138)。每个系统都会有多个计时器来管理时间。TSC 在主机上并不稳定，**cpufreq** 改变，deep C state，或迁移到一个有更快的 TSC 主机都可能会对它产生影响。Deep C 休眠可能导致 TSC 被停止。为了防止内核使用 deep C states，把 **"processor.max_cstate=1"** 添加到主机的 **grub.conf** 文件的内核引导选项中：

```
term Red Hat Enterprise Linux Server (2.6.18-159.el5)
    root (hd0,0)
kernel /vmlinuz-2.6.18-159.el5 ro root=/dev/VolGroup00/LogVol00 rhgb quiet processor.max_cstate=1
```

编辑 **/etc/sysconfig/cpuspeed** 配置文件，把 **MIN_SPEED** 和 **MAX_SPEED** 变量设置为最高的有效主频来禁用 **cpufreq**（只需要在没有 **constant_tsc** 的主机上进行）。您可以在 **/sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies** 文件中找到有效主频值。

**使用 engine-config 工具在主机不同步的时候接收警告信息。**

您可以使用 **engine-config** 工具在主机不同步的时候接收配置信息。

主机上有两个与时间漂移（time drift）相关的参数：**EnableHostTimeDrift** 和 **HostTimeDriftInSec**。**EnableHostTimeDrift** 可以被启用来接收关于主机时间漂移的警告信息（它的默认值是“false”）。**HostTimeDriftInSec** 参数用来指定在开始发送漂移警告信息前可以发生的最大时间漂移。

每个主机每小时会发送一次警告信息。

**在运行 CentOS 的系统上使用准虚拟化时钟**

对于一些特定的 Red Hat Enterprise Linux 虚拟机，需要为它们配置额外的内核参数。这些参数可以被添加到虚拟机上的 /boot/grub/grub.conf 文件中的 /kernel 行的后面。


> **注意**
>
> 使用 **ktune** 软件包可以自动配置内核参数。

**ktune** 软件包提供了一个交互式的 Bourne shell 脚本 - **fix_clock_drift.sh**。当以 superuser 的身份运行时，这个脚本会检查不同的系统参数来判断是否虚拟机可能会出现时间漂移的问题。如果会出现问题，它会在 **/boot/grub/** 目录中创建一个新的 **grub.conf.kvm** 文件。这个文件包括了一个 KVM 引导行，这个引导行带有可以防止时钟漂移的内核参数。在以 superuser 的身份运行 **fix_clock_drift.sh** 命令并创建了 **grub.conf.kvm** 文件后，系统管理员应该手动备份当前的 **grub.conf** 文件，并检查新的 **grub.conf.kvm** 文件中除了新添加的引导行参数以外的内容和 **grub.conf** 文件的内容完全一致。最后，把 **grub.conf.kvm** 文件的文件名改为 **grub.conf** 并重新启动虚拟机。

下表列出了 Red Hat Enterprise Linux 的版本以及在没有 constant TSC 的系统上运行的虚拟机所需要的参数

|CentOS|额外的虚拟机内核参数|
|------|--------------------|
|5.4 AMD64/Intel 64 有准虚拟化时钟（with paravirtualized clock）|不需要额外的参数|
|5.4 AMD64/Intel 64 没有准虚拟化时钟（without paravirtualized clock）|notsc lpj=n|
|5.4 x86 有准虚拟化时钟（with the paravirtualized clock）|不需要额外的参数|
|5.4 x86 没有准虚拟化时钟（without the paravirtualized clock）|clocksource=acpi_pm lpj=n|
|5.3 AMD64/Intel 64|notsc|
|5.3 x86|clocksource=acpi_pm|
|4.8 AMD64/Intel 64|notsc|
|4.8 x86|clock=pmtmr|
|3.9 AMD64/Intel 64|不需要额外的参数|
|3.9 x86|不需要额外的参数|


**在 Windows 虚拟机上使用 Real-Time Clock**

Windows 使用 Real-Time Clock (RTC) 和 the Time Stamp Counter (TSC)。对于 Windows 虚拟机，Real-Time Clock 可以代替 TSC 作为所有的时间源。这可以解决虚拟机时间的问题。

要为 PMTIMER 时钟源启用 Real-Time Clock（PMTIMER 通常使用 TSC），把以下行添加到 Windows 引导设置中。Windows 引导设置保存在 boot.ini 文件中。在 **boot.ini** 文件中添加以下行：

```
/use pmtimer
```

如需更多关于 Windows 引导设置和 pmtimer 选项的信息，请参阅 [Available switch options for the Windows XP and the Windows Server 2003 Boot.ini files](http://support.microsoft.com/kb/833721)。
