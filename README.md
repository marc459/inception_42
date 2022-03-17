## Inception_42 ##
This project virtualize several Docker images, creating a complete web aplication interconecting Wordpress, nginx,  MariaDB implemented with Docker-compose.

## Usage ##

add "127.0.0.1 msantos-.42.fr" to /etc/hosts

make

## Credentials ##

DOMAIN_NAME=msantos-.42.fr
MYSQL_ROOT_PASSWORD=theking
MYSQL_USER=msantos
MYSQL_PASSWORD=msantospass

WP_USER=msantospass
WP_PASSWORD=msantospass


## Dependencys ##
make,git,docker,docker-compose,curl


## THEORY ##
DOCKER NETWORK
https://runnable.com/docker/docker-compose-networking

Mandatory
-- How docker and docker-compose works? --
Docker es una plataforma de código abierto que hace uso de las funciones de aislamiento
 de recursos del kernel de Linux para poder dar lugar a contenedores independientes
Docker-compose es una herramienta que permite
automatizar la construccion y el despliegue de contenedores docker

-- The difference between a Docker image used with docker-compose and
without docker-compose--
Generar una contendor con docker compose es mucho mas simple , ya que escrbibir las sentencias
en un archivo reglado, permite generarlos de forma mas atuomatizada.

--The beneﬁt of Docker compared to VMs
Ligereza , ya que lo unico que comparte es el kernel del SO host, ademas de que
todos los contenedores que se ejecutan a la vez comparten recursos.

--The pertinence of the directory structure required for this project
Es importante aislar los recursos y los contenedores con los servicios requeridos
para ejecutar la aplicacion.Es por ello por lo que se crea una estructura organizada y
ramificada.

- The evaluated student has to give you a simple explanation of
docker-network

Docker networking is primarily used to establish communication between Docker containers
 and the outside world via the host machine where the Docker daemon is running.

#CHECK
- The use of a TLS v1.2/v1.3 certiﬁcate is mandatory and must be
demonstrated.
curl -I -v --tlsv1.2 --tls-max 1.2 https://msantos-.42.fr

- Ensure that you can add a comment using the available WordPress user.

-This part is pretty straightforward. You have to reboot the virtual
machine. Once it has restarted, launch docker-compose again. Then,
verify that everything is functional, and that both WordPress and
MariaDB are conﬁgured.
