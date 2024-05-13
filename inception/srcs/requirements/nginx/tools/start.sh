#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/L=TET/O=1337/OU=student/CN=mdenguir.42.fr"


nginx -g "daemon off;"
