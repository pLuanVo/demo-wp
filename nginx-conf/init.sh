#!/bin/bash

read -p "Enter your domain: " domain

echo "##### Replace $domain to config file... #####\n\n"
find ../ -type f -exec sed -i -e "s/domain.com/$domain/g" {} \;


echo "##### Starting http webserver... #####\n\n"
cat "http-nginx.conf" > nginx/nginx.conf
docker-compose up -d db wordpress webserver

sleep 5

echo "##### Creating ssl key... #####\n\n"
docker-compose up --no-deps certbot

echo "##### Restarting webserver with new config... #####\n\n"
cat "https-nginx.conf" > nginx/nginx.conf
docker-compose up -d --force-recreate --no-deps webserver

######## renew ssl: docker-compose up --no-deps certbot ##########
#