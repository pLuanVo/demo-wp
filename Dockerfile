FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install nginx -y && \
    apt install -y \
    mariadb-server \
    mariadb-client \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-xmlrpc \
    wget \
    nano

# Nginx setting
RUN sed -i -e 's/user\s*nginx;/user www-data;/' /etc/nginx/nginx.conf
ADD ./nginx-site.conf /etc/nginx/conf.d/default.conf

# php-fpm setting
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php/7.4/fpm/php.ini && \
    sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 10M/g" /etc/php/7.4/fpm/php.ini && \
    sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 20M/g" /etc/php/7.4/fpm/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.4/fpm/php-fpm.conf && \
    sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php/7.4/fpm/pool.d/www.conf
RUN find /etc/php/7.4/cli/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;
RUN mkdir -p /run/php

# Supervisor setting
RUN apt-get install -y python3-pip
RUN pip3 install supervisor
RUN pip3 install supervisor-stdout
ADD ./supervisord.conf /etc/supervisor/supervisord.conf

# wordpress
ADD https://wordpress.org/latest.tar.gz /usr/share/nginx/latest.tar.gz
RUN cd /usr/share/nginx/ && tar xvf latest.tar.gz && rm latest.tar.gz
RUN mv /usr/share/nginx/wordpress /usr/share/nginx/www

RUN chown -R www-data:www-data /usr/share/nginx/www

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80 3306 9001

VOLUME ["/var/lib/mysql", "/usr/share/nginx/www"]

CMD ["/bin/bash", "/start.sh"]