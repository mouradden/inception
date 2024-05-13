FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client

RUN mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

RUN chmod +x /var/lib/mysql/

EXPOSE 3306

COPY ./tools/start.sh /

RUN chmod +x /start.sh

CMD ["/start.sh"]