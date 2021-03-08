AUR:
  pkg.installed:
    - pkgs:
      - yay

AUR Dependencies:
  pkg.group_installed:
    - name: base-devel

# https://wiki.manjaro.org/index.php/Swap#Creating_and_Enabling_a_Static_Swapfile
Enable hibernation:
  cmd.run:
    - name: |
        sudo fallocate -l 16G /swapfile
        sudo mkswap /swapfile
        sudo chmod u=rw,go= /swapfile
        sudo swapon /swapfile
        echo "/swapfile none swap defaults 0 0" | tee -a /etc/fstab
    - creates:
      - /swapfile
