# Use base build
FROM php-libraries:latest

# Install PHP PECL extensions
RUN pecl install xdebug-2.9.8 \
 && docker-php-ext-enable xdebug