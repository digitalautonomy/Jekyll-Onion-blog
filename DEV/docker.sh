#!/usr/bin/env bash

set -e

# This command will build the docker images that has all the stuff needed to deploy your new Jekyll blog
docker build -t jekyll-template:latest ../

# This command automate the execution of the docker container in a way that the Tor service can show your blog to Internet
# and you will can update contents automatically
docker run -d --restart always -p 35729:35729 -p 4000:4000 --mount type=bind,src="$(pwd)",target=/home/jekyll/app jekyll-template:latest
