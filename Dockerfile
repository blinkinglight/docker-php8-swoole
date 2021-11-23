FROM alpine:latest

RUN mkdir -p /var/www/html
WORKDIR /var/www/html/

RUN echo "UTC" > /etc/timezone
RUN apk add --no-cache zip unzip curl curl-dev

RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd
RUN apk add --no-cache gcc g++ musl-dev make curl curl-dev openssl-dev zlib-dev openssl autoconf

RUN apk add --no-cache php8 \
    php8-common \
    php8-posix \
    php8-dev \
    php8-pear \
    php8-fpm \
    php8-pdo \
    php8-opcache \
    php8-zip \
    php8-phar \
    php8-iconv \
    php8-cli \
    php8-curl \
    php8-openssl \
    php8-mbstring \
    php8-tokenizer \
    php8-fileinfo \
    php8-json \
    php8-xml \
    php8-xmlwriter \
    php8-simplexml \
    php8-dom \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-tokenizer \
    php8-pecl-redis \
    php8-pcntl \
    php8-mysqlnd 

# RUN /usr/bin/pecl8 channel-update pecl.php.net
RUN /usr/bin/pear8 config-set php_ini /etc/php8/php.ini
RUN yes | /usr/bin/pecl8 install openswoole

RUN ln -s /usr/bin/php8 /usr/bin/php
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
