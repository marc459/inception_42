FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install mariadb-server mariadb-client

COPY ./srcs/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN mkdir srcs
COPY ./srcs/wordpress.sql /srcs

#COPY init.sql /var/www/
#RUN service mysql start && mysql < /var/www/init.sql
#RUN service mysql start && mysql -u root --password='admin' < /srcs/wordpress.sql
RUN service mysql start && sleep 3 && mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" && \
 #mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%';" && \
 mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
 mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';" && \
 #mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" && \
 mysql -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" && \
 mysql -e "FLUSH PRIVILEGES;"
 CMD mysqld
 #mysql -u root --password='admin' 'wordpress' < /srcs/wordpress.sql