Password Manager:
  pkg.installed:
    - pkgs:
      - bitwarden

Text editor:
  pkg.installed:
    - pkgs:
      - vim
      - vim-spell-en
  file.managed:
    - name: /home/david/.vimrc
    - source: salt://utility/vimrc
    - user: david
    - group: david
  cmd.run:
    - name: vim +PlugInstall +qall
    - runas: david

Tmux:
  pkg.installed:
    - pkgs:
      - tmux
  file.managed:
    - name: /home/david/.tmux.conf
    - source: salt://utility/tmux.conf
    - user: david
    - group: david
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: /home/david/.tmux/plugins/tpm
  cmd.run:
    - name: /home/david/.tmux/plugins/tpm/bin/install_plugins


# TODO: fisher and fish config
Fish:
  pkg.installed:
    - pkgs:
      - fish
  cmd.run:
    - name: |-
        #!/bin/sh -e

        # Update fish plugins
        fish -c 'fisher'
        
        # Updating Fish completions
        fish -c 'fish_update_completions'

Disk:
  pkg.installed:
    - pkgs:
      # Driver type stuff
      - mtools
      - ntfs-3g
      - exfat-utils

      # Visual disk usage
      - baobab

      # Encryption
      - encfs

File management:
  pkg.installed:
    - pkgs:
      - ranger
      - perl-image-exiftool  # Ranger optional dep
      - syncthing
  cmd.run:
    - name: systemctl enable --now --user syncthing.service
    - runas: david

Network:
  pkg.installed:
    - pkgs:
      - traceroute
      - nmap
      - iperf3
      - gnu-netcat
      - bind

Monitoring:
  pkg.installed:
    - pkgs:
      - nethogs
      - htop
      - iotop
      - iftop
      - cpupower

Misc:
  pkg.installed:
    - pkgs:
      - croc
      - ripgrep
      - rsync
      - wget
      - tree
      - time
      - pv
      - p7zip
      - bc
      - aria2
      - bat
