FROM debian:buster

MAINTAINER tokutaro

RUN apt-get update \
&&  apt-get upgrade --yes --force-yes  \
&&  apt-get install -y mariadb-client php-fpm php-mysql unzip \
&&  apt-get clean autoclean \
&&  apt-get autoremove -y

RUN mkdir -p /run/php /var/www

WORKDIR /var/www

COPY tools/* .
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["./entrypoint.sh"]

CMD ["php-fpm7.3", "-F", "-R"]
