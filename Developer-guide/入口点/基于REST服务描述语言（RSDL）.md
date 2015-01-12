# 基于REST服务描述语言（RSDL）

基于REST服务描述语言(RSDL)在完整的xml规范中提供了对REST
API中的结构和元素的描述，注入RSDL需要以下请求。

             GET /api?rsdl HTTP/1.1
             Accept: application/xml
          

它生成了一个如下的XML文件

             
     <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
     <rsdl href="/api?rsdl" rel="rsdl">
     <description>...</description>
     <version major="3" minor="1" build="0" revision="0"/>
     <schema href="/api?schema" rel="schema">
     <name>...</name>
     <description>...</description>
     </schema>

     <links>
     <link href="/api/capabilities" rel="get">
     ...
     </link>
     ...
     </links>
     </rsdl>

          

|元素|描述|
|----|----|
|*description*|RSDL文档的简要描述。|
|*version*|API版本包括了*major*版，*minor*版，*build*版和*revision*版。|
|*schema*|XML模式(XSD)文件的链接。|
|*links*|在API中定义每一个链接。|

每一个链接元素包含了以下结构：

            
     <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
     <rsdl href="/api?rsdl" rel="rsdl">
     ...
     <links>
     <link href="/api/..." rel="...">
     <request>
     <http_method>...</http_method>
     <headers>
     <header>
     <name>...</name>
     <value>...</value>
     </header>
     ...
     </headers>
     <body>
     <type>...</type>
     <parameters_set>
     <parameter required="..." type="...">
     <name>...</name>
     </parameter>
     ...
     </parameters_set>
     </body>
     </request>
     <response>
     <type>...</type>
     </response>
     </link>
     ...
     </links>
     </rsdl>

             

|元素|描述|
|----|----|
|*link*|一个用于API请求的URI。包括一个URI属性(*href*)和一个关系类型属性(*rel*)|
|*request*|定义了用于链接的请求属性。|
|*http\_method*|获得链接的方法类型。包括标准的HTTP REST API访问方法：*GET,POST,PUT*和*DELETE*。|
|*headers*|定义了HTTP请求头。包含了一系列的*header*元素，在请求头部包含了请求头的*name*和*value*,以此来定义请求头信息。|
|*body*|定义了HTTP请求体。包含了资源*类型*和一个*参数设置*，它包含了一系列带有定义是否需要一个的参数元素|
|*response*|定义了HTTP请求的OutPut。包含了元素类型来定义资源结构|

