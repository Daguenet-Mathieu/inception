FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql wget mariadb-client && \
    mkdir -p /run/php/ /var/www/html/wordpress && \
    rm /etc/php/7.4/fpm/pool.d/www.conf && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html/wordpress && \
    cd /var/www/html/wordpress && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    mv ./wordpress/* . && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chown -R www-data:www-data /var/www/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 9000

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["/script.sh"]
