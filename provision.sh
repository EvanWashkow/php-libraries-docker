#!/bin/sh

#
# DESTROY ANY PREVIOUS CONTAINER AND CREATE A NEW ONE
#

# Stop and destroy previous container
docker stop php-unit
docker rm php-unit

# (Re)build latest image
source $PWD/build.sh

# Start a new container named "php-unit"
docker run --name php-unit -d -p 80:80 php-unit:latest