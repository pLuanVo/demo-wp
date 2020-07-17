FROM ubuntu:latest

RUN apt-get update -y && \
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
    php-xmlrpc

COPY ./nginx/wordpress /etc/nginx/sites-available/
COPY ./start.sh /start.sh

RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/ \
    && rm /etc/nginx/sites-enabled/default \
    && sed -i -e 's/;cgi.fix.pathinfo=1/cgi.fix.pathinfo=0/g' /etc/php/7.4/fpm/php.ini \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 775 /var/www/html/ \
    && chmod +x /start.sh

EXPOSE 80 443 3306

