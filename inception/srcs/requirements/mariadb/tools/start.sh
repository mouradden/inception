#!/bin/sh
# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld
# mkdir -p /var/lib/mysql
# chown -R mysql:mysql /var/lib/mysql


# echo "FLUSH PRIVILEGES;" > db.sql
# echo "CREATE DATABASE db;" >> db.sql
# echo "CREATE USER 'mourad'@'%' IDENTIFIED BY '123';" >> db.sql
# # echo "ALTER USER 'root'@'%' IDENTIFIED BY '123' ;" >> db.sql;
# echo "GRANT ALL PRIVILEGES ON db.* TO 'mourad'@'%';" >> db.sql
# echo "FLUSH PRIVILEGES;" >> db.sql

# mysqld --user=mysql --bootstrap < db.sql

#!bin/sh

# echo "
# USE mysql;
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '123';
# CREATE DATABASE db CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER 'mourad'@'%' IDENTIFIED by '123';
# GRANT ALL PRIVILEGES ON db.* TO 'mourad'@'%';
# FLUSH PRIVILEGES;" > db.sql

# mariadbd --user=mysql --bootstrap < /db.sql

# rm -f /db.sql

# exec "$@"
# mariadbd --user=mysql --bind-address=0.0.0.0

#!bin/sh
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# USE mysql;
echo "
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED by '${DB_USER_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > init.sql
# echo "
# USE mysql;
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '123';
# CREATE DATABASE IF NOT EXISTS db ;
# CREATE USER 'mourad'@'%' IDENTIFIED by '123';
# GRANT ALL PRIVILEGES ON db.* TO 'mourad'@'%';
# FLUSH PRIVILEGES;" > init.sql


mariadbd --user=mysql --bootstrap < /init.sql
# mariadbd  < /init.sql

rm -f /init.sql

exec "$@"