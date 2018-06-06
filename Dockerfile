FROM php:7.2-apache
RUN docker-php-ext-install mysqli

ADD web/ /var/www/html

EXPOSE 80