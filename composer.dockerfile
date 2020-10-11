FROM composer:latest

# RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

WORKDIR /var/www/html

# COPY . /var/www/html
COPY start.sh /usr/local/bin/start

RUN chown -R pi:users /var/www/html \
    && chmod u+x /usr/local/bin/start

CMD ["/usr/local/bin/start"]