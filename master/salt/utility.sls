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
    - onchanges:
	  - file: /home/david/.tmux.conf

Fish config:
  file.managed:
    - name: /home/david/.config/fish/config.fish
    - contents: |
        set -gx EDITOR vim
        set -gx EDITOR code
        set -gx TZ America/Los_Angeles

Fish:
  pkg.installed:
    - pkgs:
      - fish
    - requires:
      - Fish config
  file.recurse:
    - name: /home/david/.config/fish/functions
    - source: salt://utility/fish/functions
    - user: david
    - group: david

Fish plugin manager:
  cmd.run:
    - name: curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    - shell: /bin/fish
    - creates:
      - /home/david/.config/fish/functions/fisher.fish
    - requires:
      - Fish

Fish plugins list:
  file.managed:
    - name: /home/david/.config/fish/fish_plugins
    - contents: |
        edc/bass
    - requires:
      - Fish plugin manager

Update fish plugins:
  cmd.run:
    - name: fisher update
    - shell: /bin/fish
    - requires:
      - Fish plugin manager
    - onchanges:
      - Fish plugins list

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
	- creates:
      - /usr/lib/systemd/user/syncthing.service

Network:
  pkg.installed:
    - pkgs:
      - traceroute
      - nmap
      - iperf3
      - gnu-netcat
      - bind

Wireguard:
  pkg.installed:
    - pkgs:
      - wireguard-tools
  service.running:
    - name: wg-quick@wg0
    - enable: true
  file.managed:
    - name: /etc/wireguard/wg0.conf
    - user: root
    - group: root
    - contents: |
        [Interface]
        Address = 10.0.0.4
        PrivateKey = {{ pillar['network']['wireguard']['key'] }}
        # Pi-hole DNS
        DNS = 10.43.0.255

        [Peer]
        PublicKey = FhEGcZJD6cg47SYdEVXruLdto9eKU6aHc7/JnJZmvRc=
        AllowedIPs = 10.0.0.1, 192.168.1.1, 192.168.1.210, 192.168.1.211, 10.43.0.0/16
        Endpoint = sigpanic.com:14927

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

EncFS:
  pkg.installed:
    - pkgs:
      - encfs
      - fuse2
  file.directory:
    - name: /mnt/encfs
    - user: david
    - group: david
    - mode: 755
