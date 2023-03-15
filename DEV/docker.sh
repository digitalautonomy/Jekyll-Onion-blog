#in this script we end clean the installation of Docker and create the images for

# check id docker user works
newgrp docker
# check if docker works
docker build hello-world -t hello
docker run --rm -d hello-world -t hello -p 80:80
docker stop hello

docker build -t jekyll-template:latest .



