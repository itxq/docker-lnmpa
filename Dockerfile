# 基于Centos7镜像
FROM centos:7

# 镜像作者信息
MAINTAINER IT小强xqitw.cn <mail@xqitw.cn>

# 安装依赖
RUN yum update -y && yum install -y wget && yum clean all

# 安装LNMPA
RUN wget http://soft.vpser.net/lnmp/lnmp1.6.tar.gz -cO lnmp1.6.tar.gz \
    && tar zxf lnmp1.6.tar.gz \
    && cd lnmp1.6 \
    && LNMP_Auto="y" \
    DBSelect="10" \
    DB_Root_Password="www_xqitw_cn" \
    InstallInnodb="y" \
    PHPSelect="9" \
    SelectMalloc="1" \
    ApacheSelect="2" \
    ServerAdmin="mail@xqitw.cn" \
    ./install.sh lnmpa

# 开放端口
EXPOSE 3306 80 22 21

CMD lnmp restart