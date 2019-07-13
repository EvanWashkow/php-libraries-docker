#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
source $PWD/stop.sh
yes | docker-compose rm

# Start a new container named "php-libraries"
source $PWD/start.sh

# Install composer dependencies and chmod them so the host can edit them
docker-compose exec php-libraries composer install
docker-compose exec php-libraries chmod -R 777 /var/www/html/vendor

# Create and chmod local debug file
docker-compose exec php-libraries touch /var/www/html/debug.log
docker-compose exec php-libraries chmod 777 /var/www/html/debug.log