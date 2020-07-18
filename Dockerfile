FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libonig-dev \
        libicu-dev \
        libgmp-dev \
        git \
        zip \
        unzip\
        && pecl install xdebug \
        && docker-php-ext-enable xdebug \
        && docker-php-ext-install -j$(nproc) gmp gd mbstring tokenizer bcmath intl mysqli pdo pdo_mysql \
        && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
        && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
        && php composer-setup.php \
        && mv composer.phar /usr/local/bin/composer \
        && php -r "unlink('composer-setup.php');"

RUN git clone https://github.com/deoclecianojunior/test-pipeline.git /var/www/html


EXPOSE 9000
