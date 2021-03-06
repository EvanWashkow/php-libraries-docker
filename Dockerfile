#
# BUILD BASE IMAGE
#

# Fetch latest PHP image
FROM composer:latest AS composer
FROM php:7.1-apache

# Copy composer binary to this image
COPY --from=composer /usr/bin/composer /usr/bin

# Set up base PHP
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
 && mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini




#
# INSTALL PHP LIBRARIES SOURCE CODE
#

# Install dependencies from repository
RUN apt-get update \
 && apt-get install git unzip zip -y \
 && apt-get autoremove -y \
 && apt-get clean

# Copy Git submodule into image
ADD php-libraries/ /var/www/html/

# Cleanup install
RUN rm -rdf /var/www/html/debug.log

# Composer install
RUN composer install

# Set file permissions
RUN chown -R www-data:www-data /var/www/html/