Documents for building eayun doc
==========

Install
=======

#### On ubuntu
```bash
$ sudo apt-get -y install publican
```

Setup and build
========

克隆项目
=======

```bash
$ git clone git@github.com:eayun/Documents.git
```

建立文档
=======

```bash
$ cd Documents
$ publican create --name=FAQ --version=0.1 --product=eayun-documents --brand=eayun --lang=zh-CN --type=article
```

编译: (use FAQ as a example)
=======

```bash
$ cd FAQ
$ publican build --formats=html,pdf,html-single,html-desktop,txt,epub --langs=zh-CN --brand_dir=[your-doc-path]
```

安装到web站点
=======

```bash
$ publican build --publish --formats=html,html-single --langs=zh-CN --brand_dir=[your-doc-path]
$ sudo publican install_book --site_config=[configure-file*.cfg] --lang=zh-CN
```
