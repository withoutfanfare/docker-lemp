#!/usr/bin/env bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

echo $role;
echo $env;

(cd /var/www/html && chmod -R 777 storage/logs && chmod -R 777 framework/logs && chmod -R 777 storage/app )

if [ "$env" != "local" ]; then
    echo "Caching configuration."
    (cd /var/www/html && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

if [ "$role" = "app" ]; then

    echo "Running the app."
    # php /var/www/html/artisan serve

elif [ "$role" = "queue" ]; then

    echo "Running the queue."
    php /var/www/html/artisan queue:work database --tries=3 --verbose --timeout=60 --memory=2048

elif [ "$role" = "scheduler" ]; then

    echo "Scheduler Role"
    while [ true ]
    do
      php /var/www/html/artisan schedule:run --verbose --no-interaction &
      sleep 60
    done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi