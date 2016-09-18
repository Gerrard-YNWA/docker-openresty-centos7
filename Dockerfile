FROM centos:7
MAINTAINER gerrard <gyc.ssdut@gmail.com>

RUN yum install -y readline-devel \
        pcre-devel \
        openssl-devel \
        gcc \
        make \
        perl \
        wget \
        && wget https://openresty.org/download/openresty-1.11.2.1.tar.gz \
        && tar zxvf openresty-1.11.2.1.tar.gz \
        && cd openresty-1.11.2.1/ \
        && ./configure --with-http_realip_module \
        && make \
        && make install \
        && cd \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && rm -fr /openresty-1.11.2.1/ \
        && rm /openresty-1.11.2.1.tar.gz

CMD ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
