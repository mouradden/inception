#!/bin/sh

DB_USER_PASSWD=$(cat "$DB_USER_PASSWD_FILE")
DB_ROOT_PASSWD=$(cat "$DB_ROOT_PASSWD_FILE")
echo "
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED by '${DB_USER_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > init.sql

mariadbd --user=mysql  --bootstrap < /init.sql

rm -f /init.sql
# mariadbd --user=mysql --bind-address=0.0.0.0
exec "$@"