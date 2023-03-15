# in this script you will find all instalations of all requirements
#authentication will be set
apt update 
#tor installation command 
apt install tor

#docker intallation command
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
groupadd docker
usermod -aG docker $USER

