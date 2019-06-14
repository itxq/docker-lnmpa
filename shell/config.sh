#!/bin/sh
if [ ! -f "/usr/local/nginx/conf/nginx.conf" ];then
cp -a -p /itxq/config/nginx.conf /usr/local/nginx/conf/nginx.conf
echo "Nginx 配置文件初始化完成！\n"
else
echo "Nginx 配置文件已存在！\n"
fi

if [ ! -f "/etc/my.cnf" ];then
cp -a -p /itxq/config/my.cnf /etc/my.cnf
echo "数据库 配置文件初始化完成！\n"
else
echo "数据库 配置文件已存在！\n"
fi

if [ ! -f "/usr/local/php/etc/php.ini" ];then
cp -a -p /itxq/config/php.ini /usr/local/php/etc/php.ini
echo "PHP 配置文件初始化完成！\n"
else
echo "PHP 配置文件已存在！\n"
fi

if [ ! -f "/usr/local/apache/conf/extra/httpd-vhosts.conf" ];then
cp -a -p /itxq/config/httpd-vhosts.conf /usr/local/apache/conf/extra/httpd-vhosts.conf
echo "Apache 配置文件初始化完成！\n"
else
echo "Apache 配置文件已存在！\n"
fi