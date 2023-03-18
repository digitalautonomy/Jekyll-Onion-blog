#!/usr/bin/env bash

set -e

existing_unzip=`which unzip`
if [ -z "$existing_unzip" ]; then
  su -c "apt update && apt -y install --no-install-recommends unzip"
fi

wget https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip

unzip main.zip

rm -f main.zip

cd Jekyll-Onion-blog-main/DEV/

dev_dir=$(pwd)

chmod +x $dev_dir/*.sh

su -c "$dev_dir/install-tor.sh && $dev_dir/config-ssh-over-tor.sh"

ssh_hostname=$(cat /var/lib/tor/torified-ssh/hostname)

cat <<'END'
+---------------------------------------------------------+
  ADVERTENCIA: ¡Este enlace Onion debe ser utilizado únicamente por el administrador del blog!

  We have set up a more secure way of continuing the installation
  process. Please copy the following command and keep following the instructions!

     torify ssh $USER@$ssh_hostname "$dev_dir/second_stage.sh"
+---------------------------------------------------------+
END