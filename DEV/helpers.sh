#!/usr/bin/env bash

# Helper functions to simplify some of the common tasks we have

TORRC=/etc/tor/torrc

# Takes the name of the hidden service:
#    remove_hidden_service_from_torrc ssh
remove_hidden_service_from_torrc() {
    local name=$1
    sed -i "/^HiddenServiceDir \/var\/lib\/tor\/$name/,+1 d" $TORRC
}

# Takes the name, the public port and the local port of the hidden service:
#    add_hidden_service_to_torrc ssh 22 4222
add_hidden_service_to_torrc() {
    local name=$1
    local public_port=$2
    local local_port=$3

    echo "" >> $TORRC
    echo "HiddenServiceDir /var/lib/tor/$name/" >> $TORRC
    echo "HiddenServicePort $public_port 0.0.0.0:$local_port" >> $TORRC
}

# Waits for the onion hostname file to show up on the file system
wait_for_hidden_service() {
    local name=$1

    while [ ! -f /var/lib/tor/$name/hostname ]; do
        echo "Waiting for Tor to create onion service ($name)..."
        sleep 1
    done
}

# Takes the name, the public port and the local port of the hidden service:
#    ensure_hidden_service ssh 22 4222
ensure_hidden_service() {
    local name=$1
    local public_port=$2
    local local_port=$3

    remove_hidden_service_from_torrc $name
    add_hidden_service_to_torrc $name $public_port $local_port
    systemctl reload tor
    wait_for_hidden_service $name
}
