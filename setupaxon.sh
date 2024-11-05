# script to setup the container for the axon
docker login
docker network create axon-net
docker run -d --restart=always --net axon-net --name mysqldoc masterkube/axonmysql:3.0
docker run -d --restart=always -p 3000:8080 --net axon-net --link mysqldoc --name axon3 masterkube/axon:3.0
docker run -d --restart=always --name console -p 80:80 masterkube/console:2.0
docker run -d --restart=always --name voice -p 90:80 -p 92:443 masterkube/axonvoice:1.0
docker run -d --restart=always -p 8000:8080 --net axon-net --link mysqldoc --name dyndagservice masterkube/dyndagservice:1.0
docker run -d --restart=always -p 83:80 --name proxy masterkube/proxy:1.0
docker run -d --restart=always --name supplychain -p 85:80 masterkube/supplychain:2.0
#docker run -d -p 4000:80 --net axon-net --link mysqldoc --name axonweb masterkube/axonweb:3.0
