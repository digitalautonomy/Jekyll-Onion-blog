#!/usr/bin/env bash

set -e

existing_unzip=`which unzip || echo ""`
if [ -z "$existing_unzip" ]; then
  echo ""
  echo "Se instalará el comando 'unzip'. por favor introduzca la contraseña del usuario administrador (root) del servidor"
  su -c "apt-get -qq update && apt-get -y -qq install --no-install-recommends unzip > /dev/null"
fi

cat << END
+-------------------------------------------------------------------+
  Se iniciará el proceso de instalación y configuración de una
  manera más segura de comunicación con el servidor para que pueda
  continuar con la instalación y configuración de su blog Jekyll
  sobre Tor.

  ¡Esto tomará unos instantes!
+-------------------------------------------------------------------+
END

wget -q https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip

unzip main.zip > /dev/null

rm -f main.zip

cd Jekyll-Onion-blog-main/DEV/

dev_dir=$(pwd)

chmod +x $dev_dir/*.sh

echo ""
echo "Se instalarán varios paquetes. por favor introduzca la contraseña del usuario administrador (root) del servidor"
su -c "$dev_dir/install-tor.sh && $dev_dir/config-ssh-over-tor.sh"

ssh_hostname=`cat /tmp/ssh_hostname`

cat << END
+---------------------------------------------------------+
  Se ha configurado una manera más segura para continuar con el proceso de instalación.
  Por favor copie el siguiente comando y siga las instrucciones.

  ¡No comparta este comando con nadie!

     torify ssh -t $USER@$ssh_hostname "$dev_dir/second_stage.sh"
+---------------------------------------------------------+
END