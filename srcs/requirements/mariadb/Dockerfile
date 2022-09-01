FROM debian:buster

MAINTAINER tokutaro

RUN apt-get update \
&&	apt-get upgrade -y \
&&  apt-get install -y mariadb-server mariadb-client \
&&  apt-get clean autoclean \
&&  apt-get autoremove -y

EXPOSE 3306

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

WORKDIR /tmp

COPY tools/entrypoint.sh .
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["./entrypoint.sh"]

CMD ["mysqld"]
