# About
A salt configuration for my new HP Pavillion Laptop. [Saltstack](https://docs.saltproject.io/en/latest/) runs in a container, and secrets are encrypted (in git) via [sops](https://github.com/mozilla/sops).

# Dependencies
- docker-compose
- salt-minion
- sops

# Authorizing a new computer
Sops requires a GPG key to decrypt secrets. A new key can be added in the following fashion:
```sh
# Generate a new key (this will ask a series of questions)
gpg --full-generate-key

# Export the public key for sharing
gpg --export | curl -T - https://keys.openpgp.org

# On an already authorized computer:
#    - Add the public key signature to `.sops.yaml`
#    - Run ./sops-update-keys.sh
```

# Running
```sh
# -E necessary so that sops/gpg can find the gpg key (based on $HOME)
sudo -E ./apply.sh
```
