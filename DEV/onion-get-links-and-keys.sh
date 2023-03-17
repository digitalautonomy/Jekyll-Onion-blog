# Here are your Onion Services links

cat <<'END'
+---------------------------------------------------------+
+ Recuerde que este es el enlace que sus lectores         +
+ deben usar para acceder a su nuevo blog utilizando      +
+ Tor Browser.                                            +
+---------------------------------------------------------+
END
cat /var/lib/tor/torified-blog/hostname

cat <<'END'
+---------------------------------------------------------+
+ Recuerde que este es el enlace que únicamente usted     +
+ debe utilizar para administrar los contenidos de su     +
+ blog mediante una conexión SSH segura.                  +
+---------------------------------------------------------+
END
cat /var/lib/tor/torified-ssh/hostname

mkdir -p /root/blog-keys
mkdir -p /root/ssh-keys

cp /var/lib/tor/torified-blog/hs_ed25519_secret_key /root/blog-keys
cp /var/lib/tor/torified-blog/hs_ed25519_public_key /root/blog-keys
cp /var/lib/tor/torified-ssh/hs_ed25519_secret_key /root/ssh-keys
cp /var/lib/tor/torified-ssh/hs_ed25519_public_key /root/ssh-keys

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
