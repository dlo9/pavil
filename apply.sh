#!/bin/sh

#set -e

# Must run as root
if [ "$UID" -ne "0" ]; then
	echo "ERROR: Must run as root"
	exit 1
fi

# Global variables
SALT_CONTAINER_NAME="salt-master"
SCRIPT_DIR="$(realpath "$(dirname "$0")")"

# Ensure the localhost is uses this git config
ln -sfT "$SCRIPT_DIR/minion/minion.d" "/etc/salt/minion.d"

# Start the salt master
docker-compose -f "$SCRIPT_DIR/docker-compose.yaml" up --detach --build

# Apply the config to the minion
salt-call state.apply

# Stop the salt master
docker stop "$SALT_CONTAINER_NAME"
