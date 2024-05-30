FROM alpine:3.18

RUN apk update && apk add nginx openssl 

COPY ./configs/nginx.conf /etc/nginx/http.d/
EXPOSE 443

COPY ./tools/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
