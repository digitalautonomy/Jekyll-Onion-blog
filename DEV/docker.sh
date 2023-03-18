#!/usr/bin/env bash

set -e

# Detect the root of the project irrespective of what the current directory is
project_dir=$(dirname $(dirname $(readlink -f "${BASH_SOURCE:-$0}")))

# This command will build the docker images that has all the stuff needed to deploy your new Jekyll blog
docker build -t jekyll-template:latest $project_dir
cat <<END
+---------------------------------------------------------+
+ ¡La imagen Docker con su nuevo blog se ha creado        +
+ con éxito!                                              +
+---------------------------------------------------------+
END

# This command automate the execution of the docker container in a way that the Tor service can show your blog to Internet
# and you will can update contents automatically
docker run -d --restart always -p 35729:35729 -p 4000:4000 --mount type=bind,src="$project_dir",target=/home/jekyll/app jekyll-template:latest
cat <<END
+---------------------------------------------------------+
+ ¡Su nuevo blog ha sido desplegado con éxito!            +
+---------------------------------------------------------+
END
