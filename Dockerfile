# Fetch latest PHP image
FROM php:7.1-apache

# Expose HTTP
EXPOSE 80

# Set working directory to web root (affects interactive shell)
WORKDIR /var/www/html

# Install additional software
RUN apt update
RUN yes | apt install git