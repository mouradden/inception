
NAME = inception

all: init
	docker-compose -p ${NAME} -f srcs/docker-compose.yml up

init:
	sh srcs/requirements/tools/init.sh

clean:
	docker-compose -p ${NAME} -f srcs/docker-compose.yml down -v

fclean: clean
	sudo rm -rf /home/${USER}/data
	docker system prune -af

re: all

.PHONY: all clean fclean re