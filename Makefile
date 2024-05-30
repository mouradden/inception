all: init
	docker-compose -f srcs/docker-compose.yml up --build

init:
	sh srcs/requirements/tools/init.sh

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	sudo rm -rf /home/${USER}/data
	docker system prune -af

cleanVolumes :
	sudo rm -rf /home/${USER}/data

re: fclean all

.PHONY: all clean fclean re

