FROM debian:buster

MAINTAINER tokutaro

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	nginx \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y

WORKDIR /tmp

RUN mkdir /etc/nginx/ssl

COPY tools/* .
COPY conf/* /etc/nginx/ssl

EXPOSE 443

ENTRYPOINT [ "./entrypoint.sh"]

CMD [ "nginx", "-g", "daemon off;"]

