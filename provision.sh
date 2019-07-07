#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
docker-compose stop php-libraries
yes | docker-compose rm php-libraries

# Start a new container named "php-libraries", mounting host's www at web root
docker-compose up -d
docker exec php-libraries composer install