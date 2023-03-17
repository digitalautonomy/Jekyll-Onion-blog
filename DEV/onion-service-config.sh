#!/usr/bin/env bash

set -e

# This script will be configure the Tor onion services

# Set Onion service for the Jekyll Blog
echo "HiddenServiceDir /var/lib/tor/torified-blog/" >> /etc/tor/torrc ;
echo "HiddenServicePort 80 0.0.0.0:4000" >> /etc/tor/torrc ;


# Set Onion service for the SSH channel
echo "HiddenServiceDir /var/lib/tor/torified-ssh/" >> /etc/tor/torrc ;
echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc ;

# Restart tor to apply changes
systemctl restart tor

cat <<'END'
+---------------------------------------------------------+
+ Onion Services has been successfully configured         +
+---------------------------------------------------------+
END

# Here your Onion Services links

cat <<'END'
+---------------------------------------------------------+
+ Recuerde que este es el enlace que sus lectores         +
+ deben utilizar para acceder a su nuevo blog utilizando  +
+ Tor Browser                                             +
+---------------------------------------------------------+
END
cat /var/lib/tor/torified-blog/hostname

cat <<'END'
+---------------------------------------------------------+
+ Recuerde que este es el que únicamente usted debe       +
+ utilizar para administrar los contenidos de su blog     +
+ mediante una conexión SSH segura                        +
+---------------------------------------------------------+
END
cat /var/lib/tor/torified-ssh/hostname


