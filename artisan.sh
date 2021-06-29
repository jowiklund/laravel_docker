#!/bin/bash
export $(grep -v '^#' .env | xargs)

docker exec ${PROJECT_NAME}-php-apache php artisan $*
