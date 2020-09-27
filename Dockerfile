FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

EXPOSE 6001

CMD ["php", "artisan", "websockets:serve"]

RUN apk update \
    && apk add \
    wget zip unzip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip
