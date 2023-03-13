#!/usr/bin/env bash

docker run --rm -d -p 35729:35729 -p 4000:4000 --mount type=bind,src="$(pwd)",target=/home/jekyll/app jekyll-template:latest