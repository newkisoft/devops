sudo docker stop $(sudo docker ps -aq -f name=jenkins-blueocean)
sudo docker rm $(sudo docker ps -aq -f name=jenkins-blueocean)

sudo docker build -t myjenkins-blueocean:1.1 .
sudo docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 9090:8080 --publish 50000:50000 \
  --publish 5000:5000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:1.1
sudo docker exec -d -w /BaGet/ jenkins-blueocean dotnet BaGet.dll 


