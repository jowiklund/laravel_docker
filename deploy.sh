#!/bin/bash
export $(grep -v '^#' .env | xargs)

if [ -z "$PROJECT_NAME" ]
then
echo "You need to setup the .env file"
exit
fi

clear
echo "Setting up ${PROJECT_NAME}"
sleep 1	
clear

echo "Setting up apache"
bash ./bin/apache-setup.sh

echo "Creating docker containers"
docker-compose up -d --build

echo "Setting up laravel"
docker exec ${PROJECT_NAME}-php-apache composer install
docker exec ${PROJECT_NAME}-php-apache chmod -R 777 ./storage
docker exec ${PROJECT_NAME}-php-apache mv .env.example .env
docker exec ${PROJECT_NAME}-php-apache php artisan key:generate