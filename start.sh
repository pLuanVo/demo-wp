#!/bin/bash
if [ ! -f /usr/share/nginx/www/wp-config.php ]; then
  
  WORDPRESS_DB="wordpress"
  MYSQL_PASSWORD="1234"
  WORDPRESS_PASSWORD="wordpress"

  /usr/bin/mysqld_safe &
  sleep 3s
  
  sed -e "s/database_name_here/$WORDPRESS_DB/
  s/username_here/$WORDPRESS_DB/
  s/password_here/$WORDPRESS_PASSWORD/" /usr/share/nginx/www/wp-config-sample.php > /usr/share/nginx/www/wp-config.php

  chown www-data:www-data /usr/share/nginx/www/wp-config.php

  mysqladmin -u root password $MYSQL_PASSWORD
  mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
  killall mysqld
fi

# start all the services
/usr/local/bin/supervisord -n