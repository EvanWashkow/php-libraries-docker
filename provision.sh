#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
source $PWD/stop.sh
yes | docker-compose rm

# Start a new container named "php-libraries", mounting host's www at web root
source $PWD/start.sh
docker-compose exec php-libraries composer install