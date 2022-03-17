
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mysql start
    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWORD}';" &&\
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
	mysql -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" && \
    mysql -e "FLUSH PRIVILEGES;"
    service mysql stop
fi
#sleep 5
mysqld