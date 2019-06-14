#!/bin/sh
if [ ! -d "/usr/local/mariadb/var/mysql" ];then
cp -a /itxq/mariadb/* /usr/local/mariadb/var/
echo "数据库data目录初始化完成"
else
echo "数据库data目录已存在"
fi
lnmp start && tail -f -n 1 /itxq/run.log