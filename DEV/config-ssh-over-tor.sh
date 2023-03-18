#!/usr/bin/env bash

# This script has to be run as root

set -e

echo "HiddenServiceDir /var/lib/tor/torified-ssh/" >> /etc/tor/torrc
echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc

systemctl reload tor

cat <<'END'
+---------------------------------------------------------+
+ El Onion Service para utilizar SSH sobre Tor se ha      +
+ configurado satisfactoriamente                          +
+---------------------------------------------------------+
END