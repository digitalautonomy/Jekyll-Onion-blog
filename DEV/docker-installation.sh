#!/usr/bin/env bash

set -e

# Should be run as root

TMPATH=`mktemp --tmpdir="/tmp" jekyll-onion-installation-log.XXXXXX`
export DEBIAN_FRONTEND=noninteractive

# This script is useful to install all the prerequisites needed to make and launch your new Jekyll blog using Tor

apt-get update > $TMPATH

cat <<END
+---------------------------------------------+
+ La instalación de Docker se ha iniciado.    +
+ Este proceso tomará algunos minutos.        +
+---------------------------------------------+
END

# Docker intallation
apt-get -y install --no-install-recommends ca-certificates curl gnupg lsb-release > $TMPATH

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > $TMPATH

chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update > $TMPATH

apt-get -y install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > $TMPATH

# put docker as service
systemctl enable docker > $TMPATH
cat <<END
+------------------------------------------------+
+ Docker se ha instalado satisfactoriamente.     +
+------------------------------------------------+
END

echo "El log de la instalación lo puede encontrar en $TMPATH"
