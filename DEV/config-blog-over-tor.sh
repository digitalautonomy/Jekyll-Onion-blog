#!/usr/bin/env bash

# This script has to be run as root

set -e

echo "HiddenServiceDir /var/lib/tor/torified-blog/" >> /etc/tor/torrc ;
echo "HiddenServicePort 80 0.0.0.0:4000" >> /etc/tor/torrc ;

systemctl reload tor

cat <<'END'
+---------------------------------------------------------+
+ El Onion Service para el blog se ha configurado         +
+ satisfactoriamente                                      +
+---------------------------------------------------------+
END



