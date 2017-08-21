FROM nginx:1.10-alpine

MAINTAINER Jeff Kilbride <jeff@kilbride.com>

RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf /etc/nginx/fastcgi_params \
  && mkdir -p /var/www/app/webroot \
  && cp -f /usr/share/nginx/html/index.html /var/www/app/webroot \
  && mv -f /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh

COPY conf/nginx.conf conf/fastcgi_params /etc/nginx/
COPY conf/default.conf /etc/nginx/conf.d/
COPY conf/aliases.sh /etc/profile.d/
