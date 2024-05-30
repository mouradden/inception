FROM alpine:3.18

RUN apk update && \
    apk --no-cache add \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-curl \
    php81-phar \
    php81-mbstring \
    curl \
    postfix


COPY tools/start.sh /

EXPOSE 9000

RUN chmod +x /start.sh

WORKDIR /var/www/html

ENTRYPOINT [ "sh" , "/start.sh" ]

CMD ["php-fpm81", "-F"]