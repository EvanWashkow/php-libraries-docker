# Fetch PHP image
FROM php:7.3-cli-alpine

# Install source code
COPY php-libraries /usr/src/php-libraries
WORKDIR /usr/src/php-libraries