# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marcos <marcos@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/12 18:12:43 by marcos            #+#    #+#              #
#    Updated: 2022/03/15 14:26:56 by marcos           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/marcos/Desktop/inception_42/srcs/data/wordpress
	@mkdir -p /home/marcos/Desktop/inception_42/srcs/data/mdbdata
	@sudo docker-compose -f ./srcs/docker-compose.yaml build
	@sudo docker-compose -f ./srcs/docker-compose.yaml up -d

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yaml down

fclean: clean
	@sudo rm -rf ./srcs/data/*
	@sudo docker volume rm srcs_mdbdata
	@sudo docker volume rm srcs_wpdata
	
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
volumes:
	sudo docker volume ls

re: fclean all

.PHONY: all fclean re