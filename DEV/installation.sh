#!/usr/bin/env bash

set -e

TMPATH=`mktemp --tmpdir="/tmp" jekyll-onion-installation-log.XXXXXX`


# This script is useful to install all the prerequisites needed to make and launch your new Jekyll blog using Tor

apt-get update -qq > $TMPATH

cat <<'END'
+---------------------------------------------+
+ La instalación se ha iniciado.              +
+ Este proceso tomará algunos minutos.        +
+---------------------------------------------+
END

# Tor installation
apt-get install apt-transport-https -qq > $TMPATH

echo \
"deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main 
deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/tor.list > $TMPATH

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg > $TMPATH


apt-get update -qq > $TMPATH
apt-get install tor deb.torproject.org-keyring -qq > $TMPATH
cat <<'END'
+---------------------------------------------+
+ Tor se ha instalado satisfactoriamente.     +
+---------------------------------------------+
END

# Openssh installation
apt-get install openssh-server -qq > $TMPATH
cat <<'END'
+--------------------------------------------------------+
+ OpenSSH Server se ha instalado satisfactoriamente.     +
+--------------------------------------------------------+
END

# Rsync installation
apt-get install rsync -qq > $TMPATH
cat <<'END'
+-----------------------------------------------+
+ Rsync se ha instalado satisfactoriamente.     +
+-----------------------------------------------+
END

# Docker intallation
apt-get install ca-certificates curl gnupg lsb-release -qq > $TMPATH

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > $TMPATH

chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update -qq > $TMPATH

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -qq > $TMPATH

# put docker as service
systemctl enable docker
cat <<'END'
+------------------------------------------------+
+ Docker se ha instalado satisfactoriamente.     +
+------------------------------------------------+
END

echo "El log de la instalacion lo puede encontrar en $TMPATH"