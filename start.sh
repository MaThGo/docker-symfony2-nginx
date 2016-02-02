#!/bin/bash
cd /var/www

rm -rf app/cache/*
php app/console cache:clear --env=prod --no-debug
php app/console cache:warmup

if [ -n "$SF_DB_CREATE" ]
  then
  php app/console doctrine:database:create --if-not-exists
fi

if [ -n "$SF_DB_MIGRATE" ]
  then
  php app/console doctrine:migration:migrate -n
fi

php app/console assets:install --symlink web/
php app/console assetic:dump web/
chown -R www-data:www-data app/cache
chown -R www-data:www-data app/logs
chmod 777 app/cache
chmod 777 app/logs

php5-fpm&

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
nginx
