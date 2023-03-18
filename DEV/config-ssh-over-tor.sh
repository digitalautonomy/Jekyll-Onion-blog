#!/usr/bin/env bash

# This script has to be run as root

set -e

echo "HiddenServiceDir /var/lib/tor/torified-ssh/" >> /etc/tor/torrc
echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc

systemctl reload tor
while [ ! -f /var/lib/tor/torified-ssh/hostname ]; do
  echo "Waiting for Tor to create onion service ..."
  sleep 1
done

ssh_hostname=$(cat /var/lib/tor/torified-ssh/hostname)

echo $ssh_hostname > /tmp/ssh_hostname
chmod 666 /tmp/ssh_hostname

cat << END
+---------------------------------------------------------+
+ El Onion Service para utilizar SSH sobre Tor se ha      +
+ configurado satisfactoriamente                          +
+---------------------------------------------------------+
END