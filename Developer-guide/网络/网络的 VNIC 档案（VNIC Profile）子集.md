# 网络的 VNIC 档案（VNIC Profile）子集

VNIC（虚拟网络接口控制器）档案，也被称为虚拟机接口档案，是将自定义的档案应用到用户与用户组并且用来限制网络带宽。每一个
*vnicprofile* 都包含了如下元素：

|元素|类别|描述|
|----|----|----|
|*name*|字符串|档案的唯一识别号|
|*description*|字符串|档案的字符串描述|
|*network*|字符串|档案将要应用到的逻辑网络的唯一识别号。|
|*port\_mirroring*|布尔值：*true* 或 *false*|默认值为 *false*。|

                
    <vnic_profile href= "/api/vnicprofiles/f9c2f9f1-3ae2-4100-a9a5-285ebb755c0d" 
    id="f9c2f9f1-3ae2-4100-a9a5-285ebb755c0d">
     <name>Peanuts</name>
     <description>shelled</description>
     <network href= "/api/networks/00000000-0000-0000-0000-000000000009" 
    id="00000000-0000-0000-0000-000000000009"/>
     <port_mirroring>false</port_mirroring>
     </vnic_profile>
    </vnic_profiles>

              

