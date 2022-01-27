# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marcos <marcos@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/12 18:12:43 by marcos            #+#    #+#              #
#    Updated: 2022/01/27 02:22:15 by marcos           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo docker build -t mariadb_msantos ./srcs/requirements/mariadb/ 
	@sudo docker build -t wordpress_msantos ./srcs/requirements/wordpress/
	@sudo docker build -t nginx_msantos ./srcs/requirements/nginx/
	@sudo docker-compose -f ./srcs/docker-compose.yaml up -d

fclean:
	sudo docker rm -f $$(sudo docker ps -qa) && sudo docker rmi -f $$(sudo docker images -qa)
#	@docker-compose -f ./srcs/docker-compose.yaml stop
#	@docker system prune -af
#	@docker volume rm srcs_db srcs_wordpress -f
#	@docker volume prune -f

nginx:
	sudo docker run -it -p 443:443 -p 80:80 "nginx_msantos:latest"
wordpress:
	sudo docker run -it -p 9000:9000 "wordpress_msantos:latest"
mariadb:
	sudo docker run -it -p 3000:3000 "mariadb_msantos:latest"

re: fclean all

.PHONY: all fclean re