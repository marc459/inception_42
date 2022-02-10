FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install mariadb-server mariadb-client

COPY ./srcs/50-server.cnf /etc/mysql/mariadb.conf.d/

#COPY init.sql /var/www/
#RUN service mysql start && mysql < /var/www/init.sql
CMD service mysql start && mysql -e "create database wordpress;" && \
 #mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%';" && \
 mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
 mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';" && \
 #mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" && \
 mysql -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" && \
 mysql -e "FLUSH PRIVILEGES;" && sleep infinity
