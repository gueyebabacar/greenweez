#!/bin/sh

set -ex

apt-get update
apt-get install -y --no-install-recommends \
    git \
    unzip \
    zlib1g-dev \
    ca-certificates
apt-get autoremove

docker-php-ext-install zip

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet
rm composer-setup.php

# faster download
composer global --optimize-autoloader --no-interaction require "hirak/prestissimo:^0.3"

# dump() function everywhere
mkdir -p /var/www/.php
composer global --optimize-autoloader --no-interaction --working-dir=/var/www/.php require symfony/var-dumper
echo "auto_prepend_file = /var/www/.php/vendor/autoload.php" > /usr/local/etc/php/conf.d/symfony-dump.ini
