FROM debian:bookworm

RUN  apt-get update && apt-get upgrade && apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./tools/start.sh /start.sh

ENTRYPOINT ["sh", "/start.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]
