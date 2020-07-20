Using Dockerfile

From project directory:

	docker build -t lemp-wp .
	docker run -it -v ~/webroot/wordpress/:/var/www/html/ -p 8888:80 lemp-wp

        mysql -u root -p
 	
	MariaDB [(none)]> CREATE DATABASE wordpress;
	MariaDB [(none)]> CREATE USER 'wordpress'@'localhost' IDENTIFIED BY ‘wordpress’;
	MariaDB [(none)]> GRANT ALL PRIVILEGES ON wordpress.* to wordpress@‘localhost’;
	MariaDB [(none)]> FLUSH PRIVILEGES;
        MariaDB [(none)]> exit;

	service mysql restart
	service nginx restart
	service php7.4-fpm restart
