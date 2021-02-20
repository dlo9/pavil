#!/bin/sh

set -e

THIS_SCRIPT="apply.sh"
SCRIPT_DIR="$(realpath "$(dirname "$0")")"

# Must run as root
if [ "$UID" -ne "0" ]; then
	echo "$THIS_SCRIPT must be run as root -- attempting privilege escalation"
	sudo -E "$SCRIPT_DIR/$THIS_SCRIPT" "$@"
	exit $?
fi

if ! systemctl is-active docker > /dev/null; then
	echo "ERROR: Docker must be running"
	exit 1
fi

# Set cleanup trap
cleanup() {
	if "$DECRYPTED"; then
		# Remove decrypted pillar
		"$SCRIPT_DIR/sops-remove-decrypted.sh"
	fi

	# Stop the salt master
	echo "Exiting docker..."
	docker-compose down -v

	popd
}

trap cleanup EXIT

# Start running
echo "Configuring system..."

# docker-compose expects $PWD to be accurate
pushd "$SCRIPT_DIR" > /dev/null

# Ensure the localhost is uses this config
ln -sfT "$SCRIPT_DIR/minion/minion.d" "/etc/salt/minion.d"
rm -rf /etc/salt/pki
mkdir -p /etc/salt/pki/minion

# Decrypt pillar
"$SCRIPT_DIR/sops-encrypt-all.sh" || true
"$SCRIPT_DIR/sops-decrypt-all.sh"
DECRYPTED=true

# Start the salt master
if [ "$1" == "-d" ]; then
	docker-compose -f "$SCRIPT_DIR/docker-compose.yaml" up --build
else
	docker-compose -f "$SCRIPT_DIR/docker-compose.yaml" up --detach --build

	# Apply the config to the minion
	echo "Applying salt state..."
	salt-call state.apply
fi
