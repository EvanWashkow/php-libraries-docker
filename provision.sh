#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
docker stop php-libraries
docker rm php-libraries

# (Re)build latest image
source $PWD/build.sh

# Create and dummy container to copy images files to host
# This is a work around for Docker mounts wiping directories
if [ ! -d $PWD/www/php-libraries ]; then
    docker run --name php-libraries -d php-libraries:latest
    docker cp php-libraries:/var/www/html/php-libraries www/php-libraries
    docker stop php-libraries
    docker rm php-libraries
fi

# Start a new container named "php-libraries", mounting host's www at web root
docker run --name php-libraries --mount type=bind,source=$PWD/www,target=/var/www/html -d -p 80:80 php-libraries:latest