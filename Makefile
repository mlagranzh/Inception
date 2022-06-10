all:
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d
clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker volume rm mariadb wordpress
fclean: clean
	sudo rm -rf /home/celys/data/wordpress/*
	sudo rm -rf /home/celys/data/mariadb/*
	sudo docker system prune -a --volumes
re: fclean all

exec_nginx:
	docker exec -it $$(docker ps -qf name=nginx) bin/bash
exec_mariadb:
	docker exec -it $$(docker ps -qf name=mariadb) bin/bash
exec_wordpress:
	docker exec -it $$(docker ps -qf name=wordpress) bin/bash
