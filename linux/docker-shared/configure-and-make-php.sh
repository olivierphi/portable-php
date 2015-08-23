#!/bin/sh
PHP_VERSION=5.6.12
PHP_MIRROR=http://ch1.php.net/distributions/ # because why not Swizterland?

mkdir -p /shared/build
cd /shared/build

echo "Downloading PHP $PHP_VERSION sources..."
curl -SLO  $PHP_MIRROR/php-$PHP_VERSION.tar.gz
echo "Downloaded."

tar -xzf php-$PHP_VERSION.tar.gz

cd php-$PHP_VERSION
echo "PHP build configuration..."
./configure \
  --disable-shared --enable-static --disable-rpath --enable-embed=static \
  --enable-mbstring --enable-mbregex \
  --enable-phar \
  --enable-intl \
  --with-iconv \
  --enable-zip \
  --with-curl \
  --with-openssl \
  --with-pcre-regex \
  --with-pdo-mysql \
  --with-pdo-sqlite \
  --with-readline \
  --enable-cli \
  --enable-cgi=no

echo "PHP build..."
make
echo "Finished!"

cp sapi/cli/php /shared/php-cli
cp LICENSE /shared/
