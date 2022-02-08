FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install nginx openssl

RUN apt-get update

RUN rm -rf /etc/nginx/sites-available/default
COPY /srcs/default /etc/nginx/sites-available
#RUN mkdir /var/www/wordpress
#COPY /srcs/index.html /var/www/wordpress

RUN mkdir /etc/nginx/ssl \
&& chmod 750 /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/example.crt \
-keyout /etc/nginx/ssl/example.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42 School/OU=msantos/CN=localhost"

RUN apt-get update

#Iniciar servicios
CMD  service nginx start && sleep infinity
