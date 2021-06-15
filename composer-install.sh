#!/bin/sh

docker run --rm --interactive --tty \
  --volume $PWD/php-libraries:/app \
  composer install