FROM centos:7
WORKDIR /root
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install openssl nginx -y
COPY v2ray_nginx.conf /etc/nginx/conf.d/v2ray.conf
COPY start.sh start.sh
RUN openssl req -new -x509 -newkey rsa:2048 -days 3650 -nodes -keyout root.key -out root.crt -batch
RUN curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh -o install-release.sh
RUN chmod a+x install-release.sh
RUN /bin/bash install-release.sh
COPY v2ray.json v2ray.json
CMD ["/bin/bash", "/root/start.sh"]
