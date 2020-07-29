LEMP Wordpress

From directory folder:

    docker build -t lemp-wp .

    docker run -d -p 9000:80 -p 9001:9001 --name lemp-wp lemp-wp

    wordpress page: http://localhost:9000
        user: wordpress
        passs: wordpress
    supervisord admin page: http://localhost:9001
        user: supervisor
        pass: supervisor()
