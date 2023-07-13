FROM php:8.2-cli

RUN apt-get update -y && apt-get install -y --no-install-recommends\
            locales apt-utils \
            libmcrypt-dev \
            libicu-dev libpng-dev libxml2-dev \
            zip unzip libzip-dev \
            git libonig-dev libxslt-dev wget\
            npm nodejs


# inotify-tools for hot-reload
RUN apt-get install -y inotify-tools

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl zip mbstring

COPY . /var/www/html
WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
# RUN composer clear-cache
RUN composer install
RUN npm install
# RUN npm run watch &

EXPOSE 8000
# Start server with no hot-reload
# CMD ["symfony", "server:start"]
# Start server with hot-reload
# CMD ["./server_notify.sh"]
CMD symfony server:start & \
    npm run watch &\
    while inotifywait -mq -e modify -e create -e delete -e move /var/www/html; do \
        symfony server:stop && \
        symfony server:start; \
    done