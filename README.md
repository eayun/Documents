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
$ sudo npm install gitbook cheerio underscore -g
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

