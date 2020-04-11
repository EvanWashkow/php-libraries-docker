#!/bin/sh

# 
# Fix any file permission issues
# 

# Make vendor editable
docker-compose exec php-libraries chmod -R 777 /var/www/html/vendor

# Create and chmod local debug file
docker-compose exec php-libraries touch /var/www/html/debug.log
docker-compose exec php-libraries chmod 777 /var/www/html/debug.log