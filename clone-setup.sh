#!/bin/bash

while getopts u: flag
do
    case "${flag}" in
        u) git_url=${OPTARG};;
    esac
done

echo "Making src folder"
mkdir src

bash apache-setup.sh

echo "Setting up docker containers"
docker-compose up -d --build

echo "Cloning repository"
git clone $git_url src

echo "Running composer install"
docker exec ${PROJECT_NAME}-php-apache composer install
echo "Setting 777 on storage folder"
docker exec ${PROJECT_NAME}-php-apache chmod -R 777 ./storage