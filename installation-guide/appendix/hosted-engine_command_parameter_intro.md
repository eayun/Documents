# hosted-engine命令参数介绍

* hosted-engine --deploy

  * Hosted Engine的部署命令，与在界面上选择&lt; Setup Hosted Engine &gt;的作用相同。

* hosted-engine --vm-start

  * 当运行EayunOS虚拟化管理中心的虚拟机关闭时，可以使用该命令将系统启动，即启动EayunOS虚拟化管理中心虚拟机。

* hosted-engine --vm-start-paused

* hosted-engine --vm-shutdown

  * 将EayunOS虚拟化管理中心虚拟机关机。

* hosted-engine --vm-poweroff

  * 将EayunOS虚拟化管理中心虚拟机断电。

* hosted-engine --vm-status

  * 查看当前EayunOS虚拟化管理中心虚拟机的状态以及engine服务的状态。

  状态正常时，显示信息如下：
  ```
      --== Host 1 status ==--

      Status up-to-date                  : True
      Hostname                           : [hosted_engine_1_ip]
      Host ID                            : 1
      Engine status                      : {"health": "good", "vm": "up", "detail": "up"}
      Score                              : 2400
      Local maintenance                  : False
      Host timestamp                     : 245095
      Extra metadata (valid at timestamp):
              metadata_parse_version=1
              metadata_feature_version=1
              timestamp=245095 (Wed Dec  3 22:01:59 2014)
              host-id=1
              score=2400
              maintenance=False
              state=EngineUp

      --== Host 2 status ==--

      Status up-to-date                  : False
      Hostname                           : [hosted_engine_2_ip]
      Host ID                            : 2
      Engine status                      : {"reason": "vm not running on this host", "health": "bad", "vm": "down", "detail": "unknown"}
      Score                              : 2400
      Local maintenance                  : False
      Host timestamp                     : 14826
      Extra metadata (valid at timestamp):
              metadata_parse_version=1
              metadata_feature_version=1
              timestamp=14826 (Wed Nov 26 18:24:33 2014)
              host-id=2
              score=2400
              maintenance=False
              state=EngineDown
  ```

  > **提示**
  >
  > 该命令可以在任意一台开启了HA服务的HA主机上运行，能够看到除了本机之外的其他HA主机的状态信息。

* hosted-engine --add-console-password

  * 为连接EayunOS的Engine Console控制台设置密码。

  > **提示**
  >
  > 该命令必须在运行了EayunOS虚拟化管理中心虚拟机的HA主机上执行才有效。

* hosted-engine --check-liveliness

  * 查看engine服务的状态，如果EayunOS管理中心能够正常访问，则状态显示为`Hosted Engine is up!`。

* hosted-engine --connect-storage

* hosted-engine --start-pool

* hosted-engine --console

* hosted-engine --set-maintenance

  * 用法：hosted-engine --set-maintenance --mode=global | local | none
  * 维护模式的解释如下：

    * global模式：全局维护模式。当这个模式设置启用时，所有集群中的高可用代理会无视engine虚拟机的状态，允许管理员运行/关闭/修改engine虚拟机，而不会出现任何对高可用代理有任何干扰的错误。
    * local模式：本地维护模式。当这个模式设置启用时，单个的高可用代理为了让主机进入维护模式（vdsm/engine），会停止虚拟机，且不会去重启它。另一台集群里的主机会试图去启动engine虚拟机， 同时，第一台主机的维护操作可以继续进行。一个快捷的执行这个过程的方法是手动关闭engine虚拟机>，因为虚拟机在给定主机上的任何以外关闭会导致那台主机上的高可用代理暂时将自己的score降为0。在这个情况中，管理员应还应该登录到主机，并且进入维护模式，确保score不会恢复，可能导致主机获取engine的虚拟机。
    * none模式：即取消维护模式。设置维护模式为none后，则取消取消维护模式，高可用代理继续监控engine虚拟机的状态。
