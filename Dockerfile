FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

EXPOSE 6001

CMD ["php", "artisan"]
# CMD ["php", "artisan", "websockets:serve", "/usr/bin/supervisord"]

RUN apk update \
    apk update \
    && apk add \
    wget zip unzip supervisor \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# COPY supervisord.conf /etc/supervisord.conf
# ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#
#--------------------------------------------------------------------------
# Optional Software's Installation
#--------------------------------------------------------------------------
#
# If you need to modify this image, feel free to do it right here.
#
# -- Your awesome modifications go here -- #

#
#--------------------------------------------------------------------------
# Check PHP version
#--------------------------------------------------------------------------
#

RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."
