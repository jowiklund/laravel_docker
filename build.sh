#!/bin/bash
export $(grep -v '^#' .env | xargs)

if [ -z "$PROJECT_NAME" ]
then
echo "You need to setup the .env file"
exit
fi

clear
echo "Building ${PROJECT_NAME}"
sleep 1	
clear

git pull
docker exec ${PROJECT_NAME}-php-apache php artisan migrate
docker exec ${PROJECT_NAME}-php-apache php artisan config:cache
