# 基于Centos7镜像
FROM centos:7

# 镜像作者信息
MAINTAINER IT小强xqitw.cn <mail@xqitw.cn>

# LNMPA 版本
ENV LNMPA_VERSION=1.6

# MySQL ROOT 密码
ENV DB_ROOT_PASSWORD=1234567890

# 安装依赖
RUN yum update -y && yum install -y wget && yum clean all

# 安装LNMPA
RUN wget http://soft.vpser.net/lnmp/lnmp${LNMPA_VERSION}.tar.gz -cO lnmp${LNMPA_VERSION}.tar.gz \
    && tar zxf lnmp${LNMPA_VERSION}.tar.gz \
    && cd lnmp${LNMPA_VERSION} \
    && LNMP_Auto="y" \
    DBSelect="10" \
    DB_Root_Password="${DB_ROOT_PASSWORD}" \
    InstallInnodb="y" \
    PHPSelect="9" \
    SelectMalloc="1" \
    ApacheSelect="2" \
    ServerAdmin="mail@xqitw.cn" \
    ./install.sh lnmpa

# 启动脚本
RUN cd / && mkdir -m 777 itxq \
    && echo "Docker LNMPA Start Complete!" > /itxq/run.log \
    && echo "#!/bin/sh" > /itxq/run.sh \
    && echo "lnmp start" >> /itxq/run.sh \
    && echo "tail -f -n 1 /itxq/run.log" >> /itxq/run.sh

# 镜像信息
LABEL org.label-schema.schema-version="1.0.0" \
    org.label-schema.name="Docker LNMPA" \
    org.label-schema.vendor="IT小强xqitw.cn" \
    org.label-schema.license="Apache Licence 2.0" \
    org.label-schema.build-date="20190613"

# 开放端口
EXPOSE 3306 443 80 22 21 20

# 启动命令
CMD /bin/bash /itxq/run.sh