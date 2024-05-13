#!/bin/sh
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

echo "FLUSH PRIVILEGES;" > db.sql
echo "CREATE DATABASE db;" >> db.sql
echo "CREATE USER 'mourad'@'%' IDENTIFIED BY '123';" >> db.sql
# echo "ALTER USER 'root'@'%' IDENTIFIED BY '123' ;" >> db.sql;
echo "GRANT ALL PRIVILEGES ON db.* TO 'mourad'@'%';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysqld --user=mysql --bootstrap < db.sql

mariadbd --user=mysql