#!/usr/bin/env bash

set -e

# This script is useful to install all the prerequisites needed to make and launch your new Jekyll blog using Tor

apt update

# Tor installation
apt install tor -qq > /dev/null
cat <<'END'
+---------------------------------------------+
+ Tor has been successfully installed         +
+---------------------------------------------+
END

# Openssh installation
apt install openssh-server -qq > /dev/null
cat <<'END'
+--------------------------------------------------------+
+ Openssh server has been successfully installed         +
+--------------------------------------------------------+
END

# Rsync installation
apt install rsync -qq > /dev/null
cat <<'END'
+-----------------------------------------------+
+ Rsync has been successfully installed         +
+-----------------------------------------------+
END

# Docker intallation
apt-get install ca-certificates curl gnupg lsb-release -qq > /dev/null

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -qq > /dev/null

# put docker as service
systemctl enable docker
cat <<'END'
+------------------------------------------------+
+ Docker has been successfully installed         +
+------------------------------------------------+
END