# 安装OVIRT软件开发包

*摘要*.  
OVIRT软件开发包由rpm包ovirt-engine-sdk-python提供，此rpm包包含了所有的OVIRT管理端抛出的API的python语言绑定。
开发者必须先行安装此rpm包，才可使用或者编写程序。

确认使用的是root用户登录，或者是可以使用sudo的用户。

确认订阅了HOLDER的OVIRT产品。

使用yum程序安装ovirt-engine-sdk-python:

                            # yum install ovirt-engine-sdk-python
                        

*结果*.  
rpm包ovirt-engine-sdk-python现在已经安装完毕，由python实现的库现在可以在本地使用了。

