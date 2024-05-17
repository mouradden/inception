FROM alpine:3.18

# RUN apk update && apk add php php-fpm php-mysqli php-phar curl
# FROM debian:bookworm

# RUN apt update && apt install php81 php81-fpm php81-mysqli php81-phar curl
RUN apk update && \
    apk --no-cache add \
    php \
    php-fpm \
    php-mysqli \
    # php-json \
    # php-openssl \
    php-curl \
    # php-zlib \
    # php-xml \
    php-phar \
    curl \
    # php-intl \
    # php-dom \
    # php-xmlreader \
    # php-xmlwriter 
    # # php-simplexml \
    # # php-tokenizer \
    # # php-ctype \
    # # php-session \
    php-mbstring 
#WORKDIR /var/www/html
# RUN sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php81/php-fpm.d/www.conf
COPY tools/start.sh /
COPY tools/wp-config.php /
EXPOSE 9000

RUN chmod +x /start.sh
ENTRYPOINT [ "sh" , "/start.sh" ]

CMD ["php-fpm81", "-F"]