# VSS交易流程

在备份的过程中，请求者和协调此事的人：提供了从一个稳定的系统图片到备份数据，在它们使用的基础上将文件组合在一起，将信息保存在已保存的数据上。并且需要尽可能的不中断的工作流。

一个请求(在这种备份场上的示例下)为他们的元数据查询writers，并处理数据，注意对于卷影副本和备份操作的开始的writers的由县级，还会在卷影和操作备份后开始通知。

这里是在客户工具安装后，QEMU VSS提供者是如何被注册到Windows操作系统

                
    C:\Users\Administratorvssadmin list providers
    vssadmin 1.1 - Volume Shadow Copy Service administrative command-line tool
    (C) Copyright 2001-2005 Microsoft Corp.
    Provider name: 'QEMU Guest Agent VSS Provider'
    Provider type: Software
    Provider Id: {3629d4ed-ee09-4e0e-9a5c-6d8ba2872aef}
    Version: 0.12.1>
                
            

