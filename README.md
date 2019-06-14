Docker LNMPA
===============

### LNMP相关配置文件位置
+ Nginx主配置(默认虚拟主机)文件：/usr/local/nginx/conf/nginx.conf
+ 添加的虚拟主机配置文件：/usr/local/nginx/conf/vhost/域名.conf
+ MySQL配置文件：/etc/my.cnf
+ PHP配置文件：/usr/local/php/etc/php.ini
+ php-fpm配置文件：/usr/local/php/etc/php-fpm.conf
+ PureFtpd配置文件：/usr/local/pureftpd/pure-ftpd.conf 1.3及更高版本：/usr/local/pureftpd/etc/pure-ftpd.conf
+ PureFtpd MySQL配置文件：/usr/local/pureftpd/pureftpd-mysql.conf
+ Proftpd配置文件：/usr/local/proftpd/etc/proftpd.conf 1.2及之前版本为/usr/local/proftpd/proftpd.conf
+ Proftpd 用户配置文件：/usr/local/proftpd/etc/vhost/用户名.conf
+ Redis 配置文件：/usr/local/redis/etc/redis.conf

### LNMPA相关目录文件位置
+ Apache目录：/usr/local/apache/
+ Apache配置文件：/usr/local/apache/conf/httpd.conf
+ Apache虚拟主机配置文件目录：/usr/local/apache/conf/vhost/
+ Apache默认虚拟主机配置文件：/usr/local/apache/conf/extra/httpd-vhosts.conf
+ 虚拟主机配置文件名称：/usr/local/apache/conf/vhost/域名.conf