#!/bin/sh
echo "初始化开始..."
/bin/sh /itxq/shell/shell.sh
echo "初始化完成"
lnmp start && tail -f -n 1 /itxq/shell/run.log