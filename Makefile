# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marcos <marcos@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/12 18:12:43 by marcos            #+#    #+#              #
#    Updated: 2022/02/08 16:15:31 by marcos           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo docker-compose -f ./srcs/docker-compose.yaml build
	@sudo docker-compose -f ./srcs/docker-compose.yaml up -d

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yaml down

fclean: clean
#@sudo docker volume rm $$(sudo docker volume ls -q) 2> /dev/urandom
	@sudo docker system prune -af
info:
	@echo "\
   _____               _          _                          \n\
  / ____|             | |        (_)                         \n\
 | |      ___   _ __  | |_  __ _  _  _ __    ___  _ __  ___  \n\
 | |     / _ \ |  _ \ | __|/ _  || ||  _ \  / _ \|  __|/ __| \n\
 | |____| (_) || | | || |_| (_| || || | | ||  __/| |   \__ \ \n\
  \_____|\___/ |_| |_| \__|\__,_||_||_| |_| \___||_|   |___/ \n\
                                                             \n\
"
	@sudo docker ps
	@echo "\
  _____                                    \n\
 |_   _|                                   \n\
   | |   _ __ ___    __ _   __ _   ___  ___ \n\
   | |  |  _   _ \  / _  | / _  | / _ \/ __| \n\
  _| |_ | | | | | || (_| || (_| ||  __/\__ \\n\
 |_____||_| |_| |_| \__,_| \__, | \___||___/\n\
                            __/ |           \n\
                           |___/            \n\
"
											
	@sudo docker images
	

nginx:
	sudo docker exec -it nginx bash
wordpress:
	sudo docker exec -it wordpress bash
mariadb:
	sudo docker exec -it mariadb bash

re: fclean all

.PHONY: all fclean re