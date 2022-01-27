#Descargar la imagen requerida a traves de docker hub
FROM debian:buster

#Descarga e instalacion de configuraciones y servicios
RUN apt-get -y update &&  apt-get -y upgrade && \
apt -y install php php-fpm php-mysql unzip \
php-cli php-common php-mbstring php-intl php-xml

RUN mkdir -p /var/www/

COPY ./wordpress-5.7.2-es_ES.zip /var/www
WORKDIR /var/www
RUN  unzip wordpress-5.7.2-es_ES.zip

RUN apt-get update 

#Iniciar servicios
CMD /etc/init.d/php7.3-fpm start && sleep infinity