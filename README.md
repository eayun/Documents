Documents
=========

Documents

建立文档：
publican create --name=FAQ --version=0.1 --product=eayun-documents --brand=eayun --lang=zh-CN --type=article

编译: (use FAQ as a example)
cd FAQ
publican build --formats=html,pdf,html-single,html-desktop,txt,epub --langs=zh-CN --brand_dir=[your-doc-path]

安装到web站点：
sudo publican install_book --site_config=[configure-file*.cfg] --lang=zh-CN
