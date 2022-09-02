all: up

up:
	mkdir -p /home/tok/data/mariadb /home/tok/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build
