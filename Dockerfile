FROM nginx:1.14-alpine

RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf /etc/nginx/fastcgi_params \
    && mkdir -p /var/www/app/webroot \
    && cp -f /usr/share/nginx/html/index.html /var/www/app/webroot \
    && mv -f /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh

COPY conf/nginx.conf conf/fastcgi_params /etc/nginx/
COPY conf/default.conf /etc/nginx/conf.d/
COPY conf/aliases.sh /etc/profile.d/

LABEL maintainer="Jeff Kilbride <jeff@kilbride.com>" \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="MIT" \
    org.label-schema.name="NGINX Alpine" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/jeff-kilbride/nginx-alpine"
