# Fetch latest PHP image
FROM php:apache

# Expose HTTP
EXPOSE 80

# Set working directory to web root (affects interactive shell)
WORKDIR /var/www/html