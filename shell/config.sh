#!/bin/sh
if [ ! -f "/itxq/conf/nginx.conf" ];then
cp -a -p /itxq/config/nginx.conf /itxq/conf/nginx.conf
echo "Nginx 配置文件初始化完成！"
else
echo "Nginx 配置文件已存在！"
fi
rm -rf /usr/local/nginx/conf/nginx.conf
ln -sfv /itxq/conf/nginx.conf /usr/local/nginx/conf/nginx.conf

if [ ! -f "/itxq/conf/my.cnf" ];then
cp -a -p /itxq/config/my.cnf /itxq/conf/my.cnf
echo "数据库 配置文件初始化完成！"
else
echo "数据库 配置文件已存在！"
fi
rm -rf /etc/my.cnf
ln -sfv /itxq/conf/my.cnf /etc/my.cnf

if [ ! -f "/itxq/conf/php.ini" ];then
cp -a -p /itxq/config/php.ini /itxq/conf/php.ini
echo "PHP 配置文件初始化完成！"
else
echo "PHP 配置文件已存在！"
fi
rm -rf /usr/local/php/etc/php.ini
ln -sfv /itxq/conf/php.ini /usr/local/php/etc/php.ini

if [ ! -f "/itxq/conf/httpd-vhosts.conf" ];then
cp -a -p /itxq/config/httpd-vhosts.conf /itxq/conf/httpd-vhosts.conf
echo "Apache 配置文件初始化完成！"
else
echo "Apache 配置文件已存在！"
fi
rm -rf /usr/local/apache/conf/extra/httpd-vhosts.conf
ln -sfv /itxq/conf/httpd-vhosts.conf /usr/local/apache/conf/extra/httpd-vhosts.conf