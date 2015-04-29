# Hosted Engine命令的浏览

**摘要**

SSH到EayunOS虚拟化管理中心的Hypervisor HA主机命令行终端，可以使用Hosted Engine的命令进行一些操作。

1. SSH到EayunOS虚拟化管理中心的Hypervisor HA主机命令行终端，运行命令`hosted-engine --help`。

   查看hosted-engine命令的帮助信息，如下：
   ```
      Usage: /usr/sbin/hosted-engine [--help] <command> [<command-args>]
        --help
            show this help message.

        The available commands are:
            --deploy [options]
                run ovirt-hosted-engine deployment
            --vm-start
                start VM on this host
            --vm-start-paused
                start VM on this host with qemu paused
            --vm-shutdown
                gracefully shutdown the VM on this host
            --vm-poweroff
                forcefully poweroff the VM on this host
            --vm-status
                VM status according to the HA agent
            --add-console-password [--password=<password>]
                Create a temporary password for vnc/spice connection.  If
                --password is given, the password will be set to the value
                provided.  Otherwise, if it is set,  the environment variable
                OVIRT_HOSTED_ENGINE_CONSOLE_PASSWORD will be used.  As a last
                resort, the password will be read interactively.
            --check-liveliness
                Checks liveliness page of engine
            --connect-storage
                Connect the storage domain
            --start-pool
                Start the storage pool manually
            --console
                Open the configured console using remote-viewer on localhost
            --set-maintenance --mode=<mode>
                Set maintenance status to the specified mode (global/local/none)

        For additional information about a specific command try:
             <command> --help
   ```
