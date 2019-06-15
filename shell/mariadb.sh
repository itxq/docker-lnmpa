#!/bin/sh
if [ ! -d "/usr/local/mariadb/var/mysql" ];then
cp -a -p /itxq/mariadb/* /usr/local/mariadb/var/
echo "数据库data目录初始化完成！"
else
echo "数据库data目录已存在!"
fi