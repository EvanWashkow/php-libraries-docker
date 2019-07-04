#
# BUILD BASE IMAGE
#

# Fetch latest PHP image
FROM php:7.1-apache

# Expose HTTP
EXPOSE 80

# Set working directory to web root (affects interactive shell)
WORKDIR /var/www/html

# Install additional software
RUN apt update
RUN yes | apt install git




#
# INSTALL PHP LIBRARIES SO
#URCE CODE
#

# Copy contents of hosts' www folder to container's web root
ADD www/index.php /var/www/html

# Clone PHP Libraries into container's web root
RUN git clone https://github.com/EvanWashkow/php-libraries
RUN git checkout master