#!/usr/bin/env bash

# This script has to be run as root

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update > /dev/null

cat << END
+---------------------------------------------+
+ Se ha iniciado la instalación de Tor.       +
+ Este proceso tomará algunos minutos.        +
+---------------------------------------------+
END

apt-get -y install --no-install-recommends apt-transport-https gnupg > /dev/null

echo \
"deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main
deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main" > /etc/apt/sources.list.d/tor.list

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor > /usr/share/keyrings/tor-archive-keyring.gpg

apt-get update > /dev/null
apt-get -y install --no-install-recommends tor deb.torproject.org-keyring  > /dev/null

cat << END
+---------------------------------------------+
+ Tor se ha instalado satisfactoriamente.     +
+---------------------------------------------+
END