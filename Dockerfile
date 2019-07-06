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




#
# INSTALL PHP LIBRARIES SOURCE CODE
#

# Install dependencies
RUN apt update
RUN apt install git zip -y

# Copy Git submodule and composer install
ADD php-libraries/ /var/www/html/
RUN composer install