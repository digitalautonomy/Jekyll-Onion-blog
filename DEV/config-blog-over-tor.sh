#!/usr/bin/env bash

# This script has to be run as root

set -e

. $(dirname "$0")/helpers.sh

ensure_hidden_service "torified-blog" 80 4000

blog_hostname=$(cat /var/lib/tor/torified-blog/hostname)

echo $blog_hostname > /tmp/blog_hostname
chmod 666 /tmp/blog_hostname

cat <<END
+---------------------------------------------------------+
+ El Onion Service para el blog se ha configurado         +
+ satisfactoriamente                                      +
+---------------------------------------------------------+
END



