#!/bin/bash
echo "初始化开始..."
/bin/bash /itxq/shell/shell.sh
echo "初始化完成"
lnmp restart && tail -f -n 1 /itxq/shell/run.log