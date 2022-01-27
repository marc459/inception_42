FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install mariadb-server mariadb-client

COPY init.sql /var/www/
RUN service mysql start && mysql -e "echo /var/www/init.sql"

CMD service mysql start  && bash
