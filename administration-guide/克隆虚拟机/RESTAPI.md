## REST API

一个新的行为在被叫做clone的虚拟机上创建。在请求体和名称里这仅仅需要一个参数。使用REST API发送POST请求到：

`<engineUrl>/api/vms/<vm id>/clone`

请求体包含：

`<action> <vm> <name>newName</name> </vm> </action>`


克隆虚拟机。

