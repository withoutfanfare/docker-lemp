FROM php:7.4-fpm-alpine

RUN apk update \
apk update && apk add wget zip unzip libzip-dev bash \
&& docker-php-ext-install pdo pdo_mysql zip

ADD ./config/php/www.conf /usr/local/etc/php-fpm.d/www.conf

# RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

# RUN chown laravel:laravel /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

# CMD ["php", "artisan"]
