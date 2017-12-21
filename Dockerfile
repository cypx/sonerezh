FROM php:7.0-apache

RUN requirements="libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6-dev libfontconfig1-dev libav-tools libpq-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd

RUN a2enmod rewrite

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/app/tmp
RUN chown -R www-data:www-data /var/www/html/app/Config

WORKDIR /var/www/html/
