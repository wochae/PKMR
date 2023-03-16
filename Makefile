NAME=inception
DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
SETUP = -f ./srcs/requirements/tools/linux_setup.sh

all: mkvol up

mkvol:
 	mkdir -p /home/wochae/data/wordpress
 	mkdir -p /home/wochae/data/mariadb

rmvol:
 	rm -rf /home/wochae/data

setup:
	sudo sh $(SETUP)

up:
 	$(DOCKER_COMPOSE) up --build -d

down:
 	$(DOCKER_COMPOSE) down

clean: down
 	docker system prune -a

fclean: clean rmvol

re: fclean all

.PHONY: all mkvol rmvol setup up down clean fclean re