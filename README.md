# Dependencies
- docker
- salt-minion
- sops

# Running
```sh
# -E necessary so that sops/gpg can find the gpg key (based on $HOME)
sudo -E ./apply.sh
```
