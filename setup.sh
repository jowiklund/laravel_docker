#!/bin/bash
export $(grep -v '^#' .env | xargs)

if [ -z "$PROJECT_NAME" ]
then
echo "You need to setup the .env file"
exit
fi

clear
echo "Setting up ${PROJECT_NAME}"
sleep .5
clear
echo "Setting up ${PROJECT_NAME}."
sleep .5
clear
echo "Setting up ${PROJECT_NAME}.."
sleep .5
clear
echo "Setting up ${PROJECT_NAME}..."
sleep .5
clear

echo "Creating source folder"
mkdir src

bash apache-setup.sh

echo "Creating docker containers"
docker-compose up -d --build

echo "Setting up laravel"
docker exec ${PROJECT_NAME}-php-apache composer create-project laravel/laravel .
docker exec ${PROJECT_NAME}-php-apache chmod -R 777 ./storage