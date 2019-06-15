# LNMPA 版本
ARG LNMPA_VERSION=1.6

# Centos镜像版本
ARG CENTOS_VERSION=7

# MySQL ROOT 密码
ARG DB_ROOT_PASSWORD=1234567890

# Swoole 版本
ARG SWOOLE_VERSION=4.3.5

# 基于Centos镜像
FROM centos:${CENTOS_VERSION}

# 镜像作者信息
MAINTAINER IT小强xqitw.cn <mail@xqitw.cn>

# 安装依赖
RUN yum update -y && yum install -y wget && yum clean all

# 安装LNMPA
RUN wget http://soft.vpser.net/lnmp/lnmp${LNMPA_VERSION}.tar.gz -cO lnmpa.tar.gz \
    && tar zxf lnmpa.tar.gz \
    && mv lnmp${LNMPA_VERSION} lnmpa \
    && cd lnmpa \
    && LNMP_Auto="y" \
    DBSelect="10" \
    DB_Root_Password="${DB_ROOT_PASSWORD}" \
    InstallInnodb="y" \
    PHPSelect="9" \
    SelectMalloc="1" \
    ApacheSelect="2" \
    ServerAdmin="mail@xqitw.cn" \
    ./install.sh lnmpa

# 安装Redis、Opcache
RUN cd /lnmpa && yes|./addons.sh install redis && yes|./addons.sh install opcache

# 安装swoole扩展
RUN wget https://codeload.github.com/swoole/swoole-src/tar.gz/v${SWOOLE_VERSION} -cO swoole-src-${SWOOLE_VERSION}.tar.gz \
    && tar zxf swoole-src-${SWOOLE_VERSION}.tar.gz \
    && cd /swoole-src-${SWOOLE_VERSION} && phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && echo "extension=swoole.so" >> /usr/local/php/conf.d/swoole.ini

# 创建目录
RUN cd / \
    && mkdir -m 777 -p /itxq/mariadb \
    && mkdir -m 777 -p /itxq/config \
    && mkdir -m 777 -p /itxq/conf \
    && mkdir -m 777 -p /itxq/shell

# 添加shell脚本
COPY ./shell /itxq/shell

# 备份数据库data文件及LNMPA相关配置文件
RUN lnmp stop \
    && cp -a /usr/local/mariadb/var/* /itxq/mariadb/ \
    && cp -a /usr/local/nginx/conf/nginx.conf /itxq/config/ \
    && cp -a /etc/my.cnf /itxq/config/ \
    && cp -a /usr/local/php/etc/php.ini /itxq/config/ \
    && cp -a /usr/local/apache/conf/extra/httpd-vhosts.conf /itxq/config/ \
    && cp -a /usr/local/redis/etc/redis.conf /itxq/config/

# 建立软连接
RUN ln -sfv /itxq/shell/run.sh /usr/bin/run-lnmpa && chmod a+x /usr/bin/run-lnmpa

# 清理相关安装包
RUN rm -rf lnmpa.tar.gz \
    rm -rf lnmpa \
    rm -rf swoole-src-${SWOOLE_VERSION}.tar.gz \
    rm -rf swoole-src-${SWOOLE_VERSION}

# 镜像信息
LABEL org.label-schema.schema-version="1.0.0" \
    org.label-schema.name="Docker LNMPA" \
    org.label-schema.vendor="IT小强xqitw.cn" \
    org.label-schema.license="Apache Licence 2.0" \
    org.label-schema.build-date="20190615"

# 开放端口
EXPOSE 3306 443 80 22 21 20

# 启动命令
CMD ["run-lnmpa"]