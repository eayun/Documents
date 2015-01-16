Documents for building eayun doc
==========

Install
=======

tested under fedora

### install npm

```bash
$ sudo yum install npm
```

### install gitbook & gitbook-plugins

```bash
$ git clone https://github.com/eayun/Documents.git
$ cd Documents
$ sudo npm install gitbook -g
$ npm install cheerio underscore
```

build & preview the documents
==========

for instance: administration-guide

### for html version

```bash
$ cd administration-guide
$ gitbook serve .
```

After the build is complete, visit: http://localhost:4000 and see the document preview

### for pdf version

finding a sulution ...

Write document
==========

If you are writing a new chapter
* create a markdown file for that chapter
* modify SUMMARY.md (used for book's index) under the root of the corresponding document (for
  instance administration-guide/SUMMARY.md), and insert you link in the right place of the index,
  and please mind the indent.

Template for writing gitbook document
==========

```
# 标题

**概述示例**<br/>
这里是概述示例的具体内容。。。


**表明称，不要写表的序号（即不要写 "表1-1：" 部分的内容）**

|表头第一列标题|表头第二列标题|表头第三列标题|
|--------------|--------------|--------------|
|第一行一列内容|第一行二列内容||
|第二行一列内容|||


**段落标题**

段落具体内容，注意加粗的内容写法：给这个中文词语**你好**加粗；给这个英文词语 **Hello** 加粗（注意中英文之间的空格）；给这个频道 **#channel** 加粗。


**过程名称，不要写过程序号（即不要写 "过程1-1：" 部分的内容）**

1. 过程的第一步。

2. 过程的第二步。

3. 以此类推。。。

**插入图片的写法：**

![](../images/user-run-vm-1.png)

**图片脚注，不要加序号（即不要写 "图1-1：" 部分的内容）**


**参见的写法：**

更多请参见：[排版约定](排版约定.md)


**提示框的写法（注意多个提示框的内容之间用 <br/> 分隔）：**

> **注意**
>
> 注意的内容

<br/>
> **重要**
>
> 重要的内容

<br/>
> **警告**
>
> 警告的内容
```

Install (for EayunOS 4.0 documentation of dockbook format)
=======

#### On ubuntu

```bash
$ sudo apt-get -y install publican
```

### Setup and build

### 克隆项目

```bash
$ git clone git@github.com:eayun/Documents.git
```

### 建立文档

```bash
$ cd Documents/original_dockbook
$ publican create --name=FAQ --version=0.1 --product=eayun-documents --brand=eayun --lang=zh-CN
--type=article
```

### 编译: (use FAQ as a example)

```bash
$ cd FAQ 
$ publican build --formats=html,pdf,html-single,html-desktop,txt,epub --langs=zh-CN
--brand_dir=[your-doc-path]
```

### 安装到web站点

```bash
$ publican build --publish --formats=html,html-single --langs=zh-CN --brand_dir=[your-doc-path]
$ sudo publican install_book --site_config=[configure-file*.cfg] --lang=zh-CN
```

