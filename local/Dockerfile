# Use base build
FROM php-libraries:latest

# Install PHP PECL extensions
RUN pecl install xdebug \
 && docker-php-ext-enable xdebug