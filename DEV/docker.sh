#in this script we end clean the installation of Docker and create the images for

# build docker image for the blog
docker build -t jekyll-template:latest ../

#automate docker

docker run -d --restart always -p 35729:35729 -p 4000:4000 --mount type=bind,src="$(pwd)",target=/home/jekyll/app jekyll-template:latest




