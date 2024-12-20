FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/mysql/ \
    && rm -rf /etc/mysql/my.cnf

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 3306


WORKDIR /

ENTRYPOINT ["/script.sh"]