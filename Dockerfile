# 基于Centos7镜像
FROM centos:7

# LNMPA 版本
ENV LNMPA_VERSION=1.6

# 镜像作者信息
MAINTAINER IT小强xqitw.cn <mail@xqitw.cn>

# 安装依赖
RUN yum update -y && yum install -y wget && yum clean all

# 安装LNMPA
RUN wget http://soft.vpser.net/lnmp/lnmp${LNMPA_VERSION}.tar.gz -cO lnmp${LNMPA_VERSION}.tar.gz \
    && tar zxf lnmp${LNMPA_VERSION}.tar.gz \
    && cd lnmp${LNMPA_VERSION} \
    && LNMP_Auto="y" \
    DBSelect="10" \
    DB_Root_Password="www_xqitw_cn" \
    InstallInnodb="y" \
    PHPSelect="9" \
    SelectMalloc="1" \
    ApacheSelect="2" \
    ServerAdmin="mail@xqitw.cn" \
    ./install.sh lnmpa

# 删除安装包
RUN rm -rf /lnmp${LNMPA_VERSION}.tar.gz && rm -rf /lnmp${LNMPA_VERSION}

RUN echo "lnmp start success!" > /lnmp.log

# 开放端口
EXPOSE 3306 80 22 21

CMD lnmp start && tail -f -n 1 /lnmp.log