FROM php:7.2-apache
RUN a2enmod rewrite
RUN service apache2 restart
RUN docker-php-ext-install mysqli pdo_mysql

RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

# RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN pecl install xdebug-2.6.0 && docker-php-ext-enable xdebug

RUN echo 'zend_extension=xdebug.so' >> /usr/local/etc/php/php.ini
RUN echo '[xdebug]' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.idekey=VSCODE' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_port=9010' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.remote_handler=dbgp' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.remote_autostart=1' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.profiler_enable=0' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.remote_connect_back=0' >> /usr/local/etc/php/php.ini

ADD web/ /var/www/html

EXPOSE 80