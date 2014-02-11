Documents
=========

Documents

建立文档：
publican create --name=FAQ --version=0.1 --product=eayun-documents --brand=eayun --lang=zh-CN --type=article

编译：
publican build --formats=html,pdf,html-single,html-desktop,txt,epub --langs=zh-CN --brand_dir=[your-doc-path]
