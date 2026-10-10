FROM wordpress:6.6.1-php8.3-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
    libmemcached-dev \
    zlib1g-dev \
    libssl-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && apt-get purge -y --auto-remove zlib1g-dev libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/pear/*

RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
