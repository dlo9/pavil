#!/bin/sh

if [ "$UID" -ne "0" ]; then
	echo "ERROR: Must run as root"
	exit 1
fi

SCRIPT_DIR="$(realpath "$(dirname "$0")")"
LOCAL_CONFIG_DIR="$SCRIPT_DIR/config"
TARGET_CONFIG_DIR="/etc/salt"
LOCAL_SLS_DIR="$SCRIPT_DIR/salt"
TARGET_SLS_DIR="/srv/salt"

echo "Installing salt config..."
cp -a "$LOCAL_CONFIG_DIR/"* "$TARGET_CONFIG_DIR"
#cp -a config/* /etc/salt/
chown -R root:root "$TARGET_CONFIG_DIR"
#chown -R root:root /etc/salt
# TODO: copy and chown instead?
#ln -sf ./salt /srv/salt
ln -sf "$LOCAL_SLS_DIR" "$TARGET_SLS_DIR" # /srv/salt

echo "Running salt..."
salt-call --local state.apply
