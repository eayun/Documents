# EayunOS 基本配置

1. 配置网络

   1. 在主配置界面输入【1】并按下【Enter】键。
   2. 进入网络配置界面。

      看到原配置的预览。
      ```
          IP Address: old-ip
          Netmask:    old-netmask
          Gateway:    old-gateway
          DNS:    old-dns
      ```

   3. 在`Enter the IP Address or c to cancel:`的提示后面，输入要配置的IP地址，并按下【Enter】键。
   4. 在`Enter the Netmask or c to cancel:`的提示后面，输入要配置的Netmask，并按下【Enter】键。
   5. 在`Enter the Gateway or c to cancel:`的提示后面，输入要配置的Gateway，并按下【Enter】键。
   6. 在`Enter the DNS or c to cancel:`的提示后面，输入要配置的DNS，并按下【Enter】键。
   7. 此时，会对配置有一个预览，给用户提供一个修改的机会。

      用户可以输入【Y】确认修改，或【R】重新配置，或【C】取消配置。
      ```
                IP Address:   old-ip  ==> new-ip
                Netmask:  old-netmask ==> new-netmask
                Gateway:  old-gateway ==> new-gateway
                DNS:      old-dns ==> new-dns

          Confirm the network configuration ([Y]es/[R]eset/[C]ancel):
      ```

   8. 确认修改，输入【Y】并按下【Enter】键，配置网络。配置成功后，自动返回主配置界面。

   **结果**

   网络配置成功，返回主配置界面。

2. 测试网络连通性

   Engine Console 提供了一个测试网络连通性的选项。可以使用该选项，测试网络连通性。

   1. 在主配置界面输入【2】并按下【Enter】键。
   2. 进入测试网络界面，输入要ping的IP地址，并按下【Enter】键。
   3. 如果网络连通性良好，将返回信息`[test_ip]: Success!`。
   4. 你可以继续输入其他IP地址进行网络连通性测试。如果不需要再进行其他IP的ping测试，可以不输入任何内容，直接按下【Enter】键，退出测是网络界面，回到主配置界面。

3. 配置主机名

   这个选项向用户提供了主机名的修改功能。

   1. 在主配置界面输入【3】并按下【Enter】键。
   2. 进入主机名配置界面，输入要配置的主机名，并按下【Enter】键。
   3. 提示`Set the hostname to "[new_hostname]" ([Y]es/[R]eset/[C]ancel):`。

      * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
      * 输入【R】并按下【Enter】键，即重新配置并留在主机名配置界面。
      * 输入【C】并按下【Enter】键，即取消配置并返回到主配置界面。

      输入【Y】并按下【Enter】键，即确认修改保存并退出。

   **结果**

   主机名配置成功，保存配置后回到主配置界面。

4. 配置系统日期和时间

   这个选项允许你配置EayunOS虚拟化管理中心的日期和时间。

   1. 在主配置界面输入【4】并按下【Enter】键。
   2. 进入日期和时间配置界面，进行如下配置：

      * 在`Enter the current date (YYYY-MM-DD) or "c" to Cancel :`的提示后面，用YYYY-MM-DD的格式，输入要配置的日期（即当前的日期），按下【Enter】键。
      * 在`Enter the current time in 24 hour format (HH:MM:SS) or "c" to Cancel :`的提示后面，用HH:MM:SS的格式，输入要配置的时间（即当前的时间），按下【Enter】键。

   3. 提供修改的预览，提示`Apply Date and Time configuration? ([Y]es/[N]o):`，需要用户进行确认。

      * 输入【Y】并按下【Enter】键，即确认修改保存并退出。
      * 输入【N】并按下【Enter】键，即取消配置并返回到主配置界面。

      输入【Y】并按下【Enter】键，即确认修改保存并退出。

   **结果**

   系统日期和时间修改成功，更新系统日期和时间，返回到主配置界面。

5. 配置hosts文件

   需要在hosts文件中写好对应的IP域名解析。这个选项提供了hosts文件，可以直接对hosts文件进行修改。

   1. 在主配置界面输入【5】并按下【Enter】键。
   2. 打开hosts文件，根据需要修改hosts文件中的IP域名解析，修改完成后保存退出。

   **结果**

   hosts文件修改成功。

6. 重启Engine

   这个选项可以重启engine服务。

   1. 在主配置界面输入【6】并按下【Enter】键。
   2. 提示`Engine Restart ([Y]es/[N]o):`，输入【Y】并按下【Enter】键。
   3. 提示`Engine restart successfully. Press any key to continue.`，按下任意键，退出重启界面，回到主配置界面。

   > **注意**
   >
   > 当HA服务启动时（部署为完成时HA服务还没有被激活），HA服务检测到engine服务重启，认为engine服务故障，并尝试**重启Hosted Engine虚拟机**，即将整个系统重启。如果不希望系统被重启，需要启用全局维护模式。维护模式详情请参考【维护模式】。

   **结果**

   engine 服务重启成功。
