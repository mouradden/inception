FROM alpine:3.18

RUN apk update && apk add php php-fpm php-mysqli php-phar curl

#WORKDIR /var/www/html

COPY tools/start.sh /
COPY tools/wp-config.php /
EXPOSE 9000

RUN chmod +x /start.sh
ENTRYPOINT [ "sh" , "/start.sh" ]

CMD ["php-fpm81", "-F"]