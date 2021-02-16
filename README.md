# About
A salt configuration for my new HP Pavillion Laptop. [Saltstack](https://docs.saltproject.io/en/latest/) runs in a container, and secrets are encrypted (in git) via [sops](https://github.com/mozilla/sops).

# Dependencies
- docker-compose
- salt-minion
- sops

# Running
```sh
# -E necessary so that sops/gpg can find the gpg key (based on $HOME)
sudo -E ./apply.sh
```
