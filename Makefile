NAME=inception
DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
#SETUP = -f ./srcs/requirements/tools/linux_setup.sh

all: mkvol up

mkvol:
	mkdir -p /home/wochae/data/db-data
	mkdir -p /home/wochae/data/wp-data

up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean:
		$(DOCKER_COMPOSE) down --volumes

fclean: clean
		docker system prune -a
		sudo rm -rf /home/wochae/data

.PHONY: mkvol build up clean fclean