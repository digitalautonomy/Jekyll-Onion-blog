#!/usr/bin/env bash

set -e

cd Jekyll-Onion-blog-main/DEV/

dev_dir=$(pwd)

cat << END
+---------------------------------------------------------------------+
  Se iniciará el proceso de instalación y configuración de su
  servidor de Jekyll sobre Tor.

  ¡Esto tomará unos instantes!

  Por favor introduzca la contraseña del usuario administrador (root).
+---------------------------------------------------------------------+
END

su - -c "$dev_dir/docker-installation.sh $USER && $dev_dir/config-blog-over-tor.sh"

newgrp - docker <<EONG
cd Jekyll-Onion-blog-main/DEV
./docker.sh
EONG

blog_hostname=`cat /tmp/blog_hostname`

cat <<END
+---------------------------------------------------------+
 Recuerde que este es el enlace que sus lectores
 deben usar para acceder a su nuevo blog utilizando
 Tor Browser: $blog_hostname
+---------------------------------------------------------+
END