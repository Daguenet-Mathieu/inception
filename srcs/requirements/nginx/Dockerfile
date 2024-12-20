FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=madaguen.42.fr/UID=madaguen"

EXPOSE 443

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY --chmod=744 conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
