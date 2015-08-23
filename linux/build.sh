#!/bin/bash
cd docker
docker build -t drbenton/portable-php-build .
cd ..
docker run --rm -v $PWD/docker-shared:/shared drbenton/portable-php-build /shared/configure-and-make-php.sh
mv docker-shared/php-cli bin/
mv docker-shared/LICENSE bin/
mv docker-shared/libicui18n.so bin/lib/

# Want to test your fresh PHP cli build?
# $ git clone https://github.com/symfony/symfony-demo
# $ cd symfony-demo/
# $ ../php -c ../mini.php.ini composer install --no-interaction
# $ cd web/
# $ ../../php -c ../../mini.php.ini -S localhost:8000 ../vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Resources/config/router_dev.php
