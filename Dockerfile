#
# BUILD BASE IMAGE
#

# Fetch latest PHP image
FROM composer:latest AS composer
FROM php:7.1-apache

# Copy composer binary to this image
COPY --from=composer /usr/bin/composer /usr/bin

# Expose HTTP
EXPOSE 80

# Set working directory to web root (affects interactive shell)
WORKDIR /var/www/html

# Set ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Set up php.ini
RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini




#
# INSTALL PHP LIBRARIES SOURCE CODE
#

# Install dependencies
RUN apt update
RUN apt install git -y

# Copy Git submodule into image
ADD php-libraries/ /var/www/html/

# Clear out composer directories and composer install
RUN rm -rdf /var/www/html/vendor
RUN composer install