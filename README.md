# docker-php8-swoole

docker container with php8 and swoole pecl extension


github: https://github.com/blinkinglight/docker-php8-swoole


example usage: 
```
FROM spiksius/dp8s:latest

WORKDIR /var/www/html

COPY . .

RUN composer install --no-dev

RUN chown -R nobody:nobody /var/www/html/storage

RUN /usr/bin/php artisan octane:install --server=swoole
ENV OCTANE_SERVER=swoole

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
```

example of entrypoint.sh
```bash

#!/bin/sh

/usr/bin/php artisan migrate --force
/usr/bin/php artisan octane:start --host=0.0.0.0 --port=80
```

share your .env to container:
```
docker run --rm -it -v $(pwd)/.env:/var/www/.env:z [yourcontainername]
```
