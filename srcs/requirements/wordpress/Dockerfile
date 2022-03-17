#Descargar la imagen requerida a traves de docker hub
FROM debian:buster

#Descarga e instalacion de configuraciones y servicios
RUN apt-get -y update &&  apt-get -y upgrade && \
apt -y install php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
    php7.3-gmp \
    php7.3-curl \ 
    php7.3-intl \
    php7.3-mbstring \
	php7.3-xmlrpc \
    php7.3-gd \
    php7.3-xml \
    php7.3-cli \
    php7.3-zip \
    php7.3-soap \
    php7.3-imap \
    php7.3-fpm \
    wget \
    curl \
    openssl \
    sendmail \ 
    mariadb-client \
    unzip
COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

COPY /srcs/wordpress* /
RUN  unzip wordpress-5.7.2-es_ES.zip
COPY /srcs/wp-config.php /wordpress
RUN cp -rf wordpress /var/www

RUN apt-get update 
#RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
#RUN echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN cp -rf wordpress /var/www
#Iniciar servicios
#CMD /etc/init.d/php7.3-fpm start  && cp -rf wordpress /var/www && sleep infinity
#CMD cp -rf wordpress /var/www && sleep infinity
# CMD service  php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 --nodaemonize
COPY srcs/setup.sh . 
RUN chmod +x setup.sh

ENTRYPOINT ["sh", "/setup.sh"]