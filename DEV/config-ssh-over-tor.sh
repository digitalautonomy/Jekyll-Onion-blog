#!/usr/bin/env bash

# This script has to be run as root

set -e

. $(dirname "$0")/helpers.sh

ensure_hidden_service "torified-ssh" 22 22 > /dev/null

ssh_hostname=$(cat /var/lib/tor/torified-ssh/hostname)

echo $ssh_hostname > /tmp/ssh_hostname
chmod 666 /tmp/ssh_hostname

cat << END
+---------------------------------------------------------+
+ El Onion Service para utilizar SSH sobre Tor se ha      +
+ configurado satisfactoriamente                          +
+---------------------------------------------------------+
END
