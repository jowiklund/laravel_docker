FROM php:8.0-apache

ARG PROJECT_NAME
ENV PROJECT_NAME=$PROJECT_NAME

RUN apt update
RUN apt install -y \
            g++ \
            libicu-dev \
            libpq-dev \
            libzip-dev \
            zip \
            zlib1g-dev
RUN docker-php-ext-install \
            intl \
            opcache \
            pdo \
            pdo_pgsql \
            pgsql

WORKDIR /var/www/$PROJECT_NAME

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
