#Descargar la imagen requerida a traves de docker hub
FROM debian:buster

#Descarga e instalacion de configuraciones y servicios
RUN apt-get -y update &&  apt-get -y upgrade && \
apt -y install nginx openssl \
php php-fpm php-mysql \
php-cli php-common php-mbstring php-intl php-xml

RUN apt-get update

#Preparando el directorio por defecto para acceder a la web
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#Configurar SSL
RUN mkdir /etc/nginx/ssl \
&& chmod 750 /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/example.crt \
-keyout /etc/nginx/ssl/example.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42 School/OU=msantos/CN=localhost"


RUN apt-get update

#Iniciar servicios
CMD service nginx start && bash