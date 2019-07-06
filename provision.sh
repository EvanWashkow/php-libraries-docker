#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
docker stop php-libraries
docker rm php-libraries

# (Re)build latest image
source $PWD/build.sh

# Start a new container named "php-libraries", mounting host's www at web root
docker run --name php-libraries --mount type=bind,source=$PWD/php-libraries,target=/var/www/html -d -p 80:80 php-libraries:latest
docker exec php-libraries composer install