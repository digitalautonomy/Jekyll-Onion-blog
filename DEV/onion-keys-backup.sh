#!/usr/bin/env bash

set -e

mkdir -p /root/blog-onion-keys-backup
mkdir -p /root/ssh-onion-keys-backup

cp /var/lib/tor/torified-blog/hs_ed25519_secret_key /root/blog-onion-keys-backup
cp /var/lib/tor/torified-blog/hs_ed25519_public_key /root/blog-onion-keys-backup
cp /var/lib/tor/torified-ssh/hs_ed25519_secret_key /root/ssh-onion-keys-backup
cp /var/lib/tor/torified-ssh/hs_ed25519_public_key /root/ssh-onion-keys-backup

cat <<'END'
+---------------------------------------------------------+
+ Las claves públicas y privadas para el blog fueron      +
+ copiadas en root/blog-keys                              +
+                                                         +
+ Las claves públicas y privadas para la conexión SSH     +
+ fueron copiadas en root/ssh-keys                        +
+                                                         +
+ RECOMENDACIÓN: Copie estas dos carpetas a una           +
+ computadora segura y bórrelas de esta computadora.      +
+                                                         +
+ Para más información, consulte la documentación.        +
+---------------------------------------------------------+
END
