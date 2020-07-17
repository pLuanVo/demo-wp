#!/bin/bash

mysql -v
nginx -v
php -v

service mysql restart
service nginx restart
service php7.4-fpm restart
