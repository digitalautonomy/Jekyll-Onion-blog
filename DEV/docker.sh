#in this script we end clean the installation of Docker and create the images for


# put docker as service
systemctl enable docker 

# build docker image for the blog
docker build -t jekyll-template:latest .

#automate docker



