#Descargar la imagen requerida a traves de docker hub
FROM debian:buster

#Descarga e instalacion de configuraciones y servicios
RUN apt-get -y update &&  apt-get -y upgrade && \
apt -y install php php-fpm php-mysql php7.3 php-mysqli php-cli php-common php-mbstring php-intl php-xml \
unzip mariadb-client
COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/

COPY /srcs/wordpress* /
RUN  unzip wordpress-5.7.2-es_ES.zip
COPY /srcs/wp-config.php /wordpress
RUN cp -rf wordpress /var/www

RUN apt-get update 

#Iniciar servicios
CMD /etc/init.d/php7.3-fpm start && cp -rf wordpress /var/www && sleep infinity