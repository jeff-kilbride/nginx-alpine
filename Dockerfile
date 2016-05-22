FROM nginx:1.9-alpine

MAINTAINER Jeff Kilbride <jeff@kilbride.com>

WORKDIR /root
COPY .profile .

RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf && \
  mkdir -p /var/www/app/webroot && \
  cp -f /usr/share/nginx/html/index.html /var/www/app/webroot

COPY conf/nginx.conf /etc/nginx/
COPY conf/default.conf /etc/nginx/conf.d/
