#!/bin/sh

/bin/sh /itxq/shell.sh

lnmp start

tail -f -n 1 /itxq/run.log