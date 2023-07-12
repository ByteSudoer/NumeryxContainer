FROM php:8.2-cli

RUN apt-get update -y && apt-get install -y --no-install-recommends\
            locales apt-utils \
            libmcrypt-dev \
            libicu-dev libpng-dev libxml2-dev \
            zip unzip libzip-dev \
            git libonig-dev libxslt-dev wget

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash

RUN apt-get install symfony-cli
RUN echo "en_US.UTF8 UTF8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl zip mbstring

WORKDIR /app
COPY . /app

RUN composer install
RUN npm install

EXPOSE 8000
CMD symfony server:start