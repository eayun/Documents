# NIC接口类型

一个虚拟机需要一个网络接口才能联网。*nic\_interfaces*元素定义了所支持的可用网卡类型。每一个*nic\_interface*因为虚拟机的不同类型的从而取决于可用的驱动。VirtIO驱动可用于OVIRT企业级Linux4.8以及更高的版本还有Windows虚拟机也是可用的。Windows不需要驱动就可以支持rtl8139。其他Linux机器或者OVIRT企业级更早的Linux版本都使用e1000或者rtl8139。

             
    <capabilities>
        <version major="3" minor="3">
            ...
            <nic_interfaces>
               <nic_interface>e1000</nic_interface>
               <nic_interface>virtio</nic_interface>
               <nic_interface>rtl8139</nic_interface>
               <nic_interface>rtl8139_virtio</nic_interface>
            </nic_interfaces>
            ...
        </version>
    </capabilities>
             
          

