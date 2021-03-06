FROM php:7-apache

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    apt-utils \
    curl \
    git \
    bash \
    libcurl3 \
    libcurl3-dev \
    zlib1g-dev \
    mysql-client \
    libjpeg62-turbo-dev \
    libpng12-dev

RUN docker-php-ext-install curl zip pdo_mysql mysqli gd \
    && pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug-init.ini

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Composer
RUN curl -k -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p /home/composer
RUN chmod -R 777 /home/composer
RUN composer global --no-interaction --working-dir=/home/composer require symfony/var-dumper
RUN composer global --no-interaction --working-dir=/home/composer require "hirak/prestissimo:^0.3"

# Configuration
RUN a2enmod rewrite headers
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/conf.d/

# Override the image ENTRYPOINT to add some logic
COPY launcher.sh /usr/local/bin/launcher
RUN chmod +x /usr/local/bin/launcher
ENTRYPOINT ["launcher"]

# Directory of the application
WORKDIR /var/www/html

CMD ["apache2-foreground"]