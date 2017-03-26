#!/usr/bin/env sh
set -e

FILE_PREFIX=$1
COMPOSER_ARGS=$2

if [ -f ./${FILE_PREFIX}packages.txt ];
then
  apt update
  cat ./${FILE_PREFIX}packages.txt | xargs apt install -y
fi

if [ -f ./${FILE_PREFIX}php-extensions.txt ];
then
  cat ./${FILE_PREFIX}php-extensions.txt | xargs docker-php-ext-install
fi

if [ -f ./composer.json ];
then
  composer install --no-interaction ${COMPOSER_ARGS}
fi
