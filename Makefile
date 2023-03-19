NAME=inception
DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
#SETUP = -f ./srcs/requirements/tools/linux_setup.sh

all: mkvol build up

mkvol:
	mkdir -p /home/wochae/data/db-data
	mkdir -p /home/wochae/data/wp-data

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

# setup:
# 	sudo sh $(SETUP)

clean:
		$(DOCKER_COMPOSE) down --volumes

fclean: clean
		docker system prune -a
		sudo rm -rf /home/wochae/data

.PHONY: mkvol build up clean fclean