#!/usr/bin/env bash

# This script has to be run as root

set -e

echo "HiddenServiceDir /var/lib/tor/torified-blog/" >> /etc/tor/torrc ;
echo "HiddenServicePort 80 0.0.0.0:4000" >> /etc/tor/torrc ;

systemctl reload tor

while [ ! -f /var/lib/tor/torified-blog/hostname ]; do
  echo "Waiting for Tor to create onion service ..."
  sleep 1
done

blog_hostname=$(cat /var/lib/tor/torified-blog/hostname)

echo $blog_hostname > /tmp/blog_hostname
chmod 666 /tmp/blog_hostname

cat <<END
+---------------------------------------------------------+
+ El Onion Service para el blog se ha configurado         +
+ satisfactoriamente                                      +
+---------------------------------------------------------+
END



