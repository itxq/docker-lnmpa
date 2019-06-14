#!/bin/sh

echo "初始化开始...\n"

/bin/sh /itxq/shell/shell.sh

echo "初始化完成\n"

lnmp start

tail -f -n 1 /itxq/run.log