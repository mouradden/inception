#!/bin/sh

# cd /var/
# mkdir www
# cd /var/www/
# mkdir html

# sed -i -r "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/1" /etc/php81/php-fpm.d/www.conf 
#echo "creating html"
cd /var/www/html/

# chmod +x /var/www/html
#echo $PWD

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#cd /var/www/html/

wp core download --allow-root


# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# echo "hereee1"
mv /wp-config.php /var/www/html/

# echo "hereee1222"

rm -rf /var/www/html/wp-config-sample.php

# sed -i -r "s/database_name_here/db/1"   wp-config.php
# sed -i -r "s/username_here/mourad/1"  wp-config.php
# sed -i -r "s/password_here/123/1"    wp-config.php
# wp config create --dbname=db --dbuser=mourad --dbpass=123 --dbhost=mariadb --allow-root
# wp core install --url=mdenguir.42.fr/ --title=inception --admin_user=mdenguir --admin_password=123456 --admin_email=culeden@outlook.com --skip-email --allow-root
wp core install --url=mdenguir.42.fr --title=inception --admin_user=mdenguir --admin_password=123 --admin_email=culeden@outlook.com --allow-root
# --path=/var/www/html
# wp user create mdenguir culeden@outlook.com --role=author --user_pass=123456 --allow-root

sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php81/php-fpm.d/www.conf

exec "$@"




