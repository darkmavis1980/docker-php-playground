FROM php:7.2-apache
RUN docker-php-ext-install mysqli
RUN pecl install xdebug-2.6.0 && docker-php-ext-enable xdebug
RUN mkdir /tmp/xdebug_log
RUN chmod 0755 /tmp/xdebug_log
RUN echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20180129/xdebug.so"' >> /usr/local/etc/php/php.ini
RUN echo '[xdebug]' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_port=9010' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_handler = "dbgp"' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.overload_var_dump=0' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.remote_host=docker.for.mac.host.internal' >> /usr/local/etc/php/php.ini
#RUN echo 'xdebug.remote_log=/tmp/xdebug_log/xdebug.log' >> /usr/local/etc/php/php.ini

ADD web/ /var/www/html

EXPOSE 80 9010