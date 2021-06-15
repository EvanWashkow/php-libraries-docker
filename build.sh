#!/bin/sh

rm -rdf php-libraries
git clone https://github.com/EvanWashkow/php-libraries php-libraries
source ./composer-install.sh
docker build --tag php-libraries:latest .