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

cp /var/lib/tor/torified-blog/hs_ed25519_secret_key /root/blog-keys
cp /var/lib/tor/torified-blog/hs_ed25519_public_key /root/blog-keys
cp /var/lib/tor/torified-blog/hs_ed25519_secret_key /root/ssh-keys
cp /var/lib/tor/torified-blog/hs_ed25519_public_key /root/ssh-keys

cat <<'END'
+---------------------------------------------------------+
+ Las claves públicas y privadas para el blog fueron      +
+ copiadas en root/blog-keys                              +
+                                                         +
+ Las claves públicas y privadas para la conexión SSH     +
+ fueron copiadas en root/ssh-keys                        +
+                                                         +
+ RECOMENDACIÓN: Copie estas dos carpetas a una           +
+ computadora segura y borrelas de esta computadora       +
+ Para más información, consulte la documentación         +
+---------------------------------------------------------+
END




