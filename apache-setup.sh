#!/bin/bash
export $(grep -v '^#' .env | xargs)

echo "Modifying apache config"
sed -i "s/laravel_docker/${PROJECT_NAME}/" ./apache/default.conf
echo "Finished modifying apache config"
