#!/usr/bin/env bash

set -e

existing_unzip=`which unzip || echo ""`
if [ -z "$existing_unzip" ]; then
  echo ""
  echo "We have to install the 'unzip' command. You will now be asked for the root password of the server:"
  su -c "apt-get -qq update && apt-get -y -qq install --no-install-recommends unzip"
fi

wget https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip

unzip main.zip

rm -f main.zip

cd Jekyll-Onion-blog-main/DEV/

dev_dir=$(pwd)

chmod +x $dev_dir/*.sh

echo ""
echo "We have to install several packages. You will now be asked for the root password of the server:"
su -c "$dev_dir/install-tor.sh && $dev_dir/config-ssh-over-tor.sh"

ssh_hostname=`cat /tmp/ssh_hostname`

cat <<'END'
+---------------------------------------------------------+
  Se ha configurado una manera más segura para continuar con el proceso de instalación.
  Por favor copie el siguiente comando y siga las instrucciones.

  ¡No comparta este comando con nadie!

     torify ssh $USER@$ssh_hostname "$dev_dir/second_stage.sh"
+---------------------------------------------------------+
END