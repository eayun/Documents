# iSCSI 和 FCP 存储

下表包含了 *storage* 描述下的与 *iscsi* 与 *fcp* 有关的元素信息。

|元素|类别|描述|属性|
|----|----|----|----|
|*logical\_unit id=*|复合型|逻辑单元的 *id*。一个存储域也能接受多个 iSCSI 或 FCP 的逻辑单元。|![](../images/lock.png)|
|*override\_luns*|布尔型|定义是否用新的配置覆盖所有逻辑单元的设置，设置 *true* 来覆盖。|![](../images/lock.png)|

*logical\_unit* 包含了一系列的子元素。

|元素|类别|描述|属性|
|----|----|----|----|
|*address*|字符串|包含存储设备的服务器地址。|![](../images/lock.png)|
|*port*|整数|服务器的端口号。|![](../images/lock.png)|
|*target*|字符串|存储设备的目标 IQN。|![](../images/lock.png)|
|*username*|字符串|登陆到目标所使用的 CHAP 用户名。|![](../images/lock.png)|
|*password*|字符串|登陆到目标所使用的 CHAP 密码。|![](../images/lock.png)|
|*serial*|字符串|目标的 serial ID 号。|![](../images/lock.png)|
|*vendor\_id*|字符串|目标的生产商名称。|![](../images/lock.png)|
|*product\_id*|字符串|目标的产品码。|![](../images/lock.png)|
|*lun\_mapping*|整数|目标的逻辑单元设备的映射。|![](../images/lock.png)|

当使用 iSCSI 的时候，如果 *logical\_unit* 描述也包含了 iSCSI
目标的详情且包含了 LUN，目标将在存储域创建好时自动登陆。
