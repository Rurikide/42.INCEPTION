FROM debian:buster

# apt-get is a command name

RUN apt-get update \
&&	apt-get upgrade -y \
&&  apt-get install -y mariadb-server mariadb-client \
&&  apt-get clean autoclean \
&&  apt-get autoremove -y

EXPOSE 3306

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

WORKDIR /tmp

COPY tools/entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["mysqld"]
