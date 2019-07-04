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

# Install additional software
RUN apt update
RUN apt install git -y




#
# INSTALL PHP LIBRARIES SOURCE CODE
#

# Copy contents of hosts' www folder to container's web root
ADD www/index.php /var/www/html

# Clone PHP Libraries into container's web root
RUN git clone https://github.com/EvanWashkow/php-libraries
RUN cd /var/www/html/php-libraries && git checkout master

# Install composer dependencies
RUN cd /var/www/html/php-libraries && composer install