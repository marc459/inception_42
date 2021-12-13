#Descargar la imagen requerida a traves de docker hub
FROM debian:buster

#Descarga e instalacion de configuraciones y servicios
RUN apt-get -y update &&  apt-get -y upgrade && \
apt -y install php php-fpm php-mysql \
php-cli php-common php-mbstring php-intl php-xml

RUN apt-get update

#Iniciar servicios
CMD service nginx start && bash