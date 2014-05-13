FROM ubuntu
MAINTAINER Connectify <bprodoehl@connectify.me>

RUN apt-get update -q
RUN apt-get install -qy supervisor apache2 libapache2-mod-php5 php5-mysql php5-memcache php5-curl wget

ADD /start-apache2.sh /start-apache2.sh
ADD /run.sh /run.sh
ADD /supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
RUN chmod 755 /*.sh

RUN mkdir /wp-download
RUN cd /wp-download && wget http://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz && rm latest.tar.gz

ADD /wp-config.php /config/wp-config.php

RUN rm -fr /var/www && ln -s /app /var/www
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod headers
ADD /security /etc/apache2/conf.d/security
ADD /php.ini /etc/php5/apache2/php.ini
ADD /apache_default /etc/apache2/sites-available/000-default.conf

# Now install APC
#RUN apt-get install -qy php-pear php5-dev make libpcre3-dev
#RUN pecl install apc
#RUN pecl install memcache

EXPOSE 80
CMD ["/run.sh"]
