# EayunOS高级配置

Engine Console 提供了对 EayunOS 虚拟化管理中心的高级配置选项（即选项【7】），可以对EayunOS虚拟化管理中心进行其他的配置。

在主界面输入【7】并按下【Enter】键，进入高级配置界面。

1. 配置 Web Portal 的 admin 用户密码

   这个选项允许管理员修改管理门户的admin用户密码。

   1. 在高级配置界面输入【3】并按下【Enter】键。
   1. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
   1. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。

      > **注意**
      >
      > 两次输入的密码必须相同。

      <br/>
      > **注意**
      >
      > 配置好密码后，engine服务会自动重启。但是，管理员也应该注意，如果不希望EayunOS系统被重启，请将系统切换至**全局维护**模式。

   **结果**

   重置 Web Portal 的 admin 用户密码成功，engine被重启，密码生效，可以使用新密码登录EayunOS虚拟化管理中心。

2. WGT_DOMAIN 初始化

   这个选项提供了默认 ISO 域"WGT_DOMAIN"的自动初始化功能。

   1. 在高级配置界面输入【4】并按下【Enter】键。
   2. 提示`Please enter the password for admin@internal:`，输入管理门户admin用户的密码。
   3. 开始进行初始化，初始化成功后，提示`WGT_DOMAIN initialization successfully.`，说明初始化成功。
   4. 按下任意键继续，则返回高级配置界面。

   **结果**

   WGT_DOMAIN 初始化成功，能够使用 WGT_DOMAIN 域，并将该域附加到数据中心里。

3. 重置 Reports Portal 的 admin 用户密码

   这个选项允许管理员修改报表门户的 admin 用户密码。

   1. 在高级配置界面中输入【5】并按下【Enter】键。
   2. 在`New password:`的提示后面，输入新的admin用户密码，并按下【Enter】键。
   3. 在`Retype new password:`的提示后面，再次输入密码，并按下【Enter】键。
   4. 开始设置密码。设置成功后，提示`Password change Successfully. Press any key to continue.`。
   5. 按任意键返回高级配置界面。

   > **注意**
   >
   > 两次输入的密码必须相同。

   <br/>
   > **注意**
   >
   > 报表门户（Reports Portal）的admin用户和管理门户（Web Portal）的admin用户不是同一个用户，他们是相互独立的用户，只是用户名相同而已。因此，报表门户的admin密码和管理门户的admin密码可以分别设置，不需要设置为相同的密码。

4. 修改数据库密码

   这个选项允许管理员修改数据库密码。

   1. 在高级配置界面中输入【6】并按下【Enter】键。
   2. 在`Please enter new password:`的提示后面，输入新的数据库密码，并按下【Enter】键。
   3. 在`Please retype new password:`的提示后面，再次输入密码，并按下【Enter】键。
   4. 密码修改成功后，提示`Reset Database password Successfully. Press any key to continue.`。
   5. 按任意键返回高级配置界面。

5. 卸载EayunOS虚拟化管理中心

   在高级配置中提供了卸载EayunOS虚拟化管理中心选项，用户可使用该选项卸载EayunOS虚拟化管理中心。

   1. 在高级配置界面输入【1】并按下【Enter】键。
   2. 根据提示卸载EayunOS虚拟化管理中心。

   > **注意**
   >
   > 卸载过程中会涉及到对配置文件和数据库的操作，请谨慎操作！

6. 配置EayunOS虚拟化管理中心

   在高级配置中提供了配置EayunOS虚拟化管理中心选项，用户可使用该选项配置EayunOS虚拟化管理中心。

   1. 在高级配置界面输入【2】并按下【Enter】键。
   2. 根据提示配置EayunOS虚拟化管理中心。

   > **注意**
   >
   > 默认环境中 EayunOS 虚拟化管理中心已经进行过初始化配置。

7. 输入【7】[ 7) Back ]并按下【Enter】键，可返回主配置界面。
