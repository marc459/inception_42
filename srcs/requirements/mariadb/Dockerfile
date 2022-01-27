FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install mariadb-server mariadb-client

CMD service mysql start  && sleep infinity
