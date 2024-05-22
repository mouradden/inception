#!/bin/sh

sed -i -r "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/1" /etc/php81/php-fpm.d/www.conf 

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp



# rm -rf /var/www/html/wp-config-sample.php

if [ ! -f wp-config.php ]; then

echo "Downloading Wordpress files :"

wp core download --allow-root

echo "Setting Up Wordpress Database : "
# WP_USER_PASSWD=$(cat "$WP_USER_PASSWD_FILE")
# echo "------------------------------"
# echo "the password is : ${WP_USER_PASSWD}"
# echo "------------------------------"
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASSWD} --dbhost=mariadb --allow-root

echo "Installing Wordpress : "

wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root

echo "Creating User : "

wp user create ${WP_USER} ${WP_USER_MAIL} --role=editor --user_pass=${WP_USER_PASSWD} --allow-root

fi

exec "$@"
