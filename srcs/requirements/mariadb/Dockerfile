FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install mariadb-server mariadb-client

COPY ./srcs/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN mkdir srcs
COPY ./srcs/wordpress.sql /srcs

COPY srcs/start.sh . 
RUN chmod +x start.sh

ENTRYPOINT ["sh", "/start.sh"]