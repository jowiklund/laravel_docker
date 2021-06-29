#!/bin/bash
export $(grep -v '^#' .env | xargs)

mkdir src

docker-compose up -d --build

docker exec ${PROJECT_NAME}-php-apache composer create-project laravel/laravel .
docker exec ${PROJECT_NAME}-php-apache chmod -R 777 ./storage