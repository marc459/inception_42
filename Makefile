# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marcos <marcos@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/12 18:12:43 by marcos            #+#    #+#              #
#    Updated: 2022/01/27 12:53:42 by marcos           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo docker-compose -f ./srcs/docker-compose.yaml build
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