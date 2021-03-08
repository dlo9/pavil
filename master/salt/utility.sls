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

Fish config:
  file.managed:
    - name: /home/david/.config/fish/config.fish
    - contents: |
        set -gx EDITOR vim
        set -gx VISUAL code
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

Cuttlefish:
  pkg.installed:
    - pkgs:
      - kubectl
      - helm
      - fluxctl
  file.managed:
    - name: /home/david/.kube/config
    - makedirs: True
    - user: david
    - group: david
    - contents: |
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdGMyVnkKZG1WeUxXTmhRREUyTURZNE1EQXdPVFl3SGhjTk1qQXhNakF4TURVeU1UTTJXaGNOTXpBeE1USTVNRFV5TVRNMgpXakFqTVNFd0h3WURWUVFEREJock0zTXRjMlZ5ZG1WeUxXTmhRREUyTURZNE1EQXdPVFl3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFRdVVvdVFNd01taUluVjRmcFVWQ20vdVFkQUZQTEg5Q3MvaU40UyswbXoKVUdhaGZQQUVEeWJyY1lCc1d6eDRvTUY1bjVpbDYzWmZYdU42MnVpRFJuT29vMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVUIxY1hJdTN6Yk91SEF0VXB6ZlpkCk9Cd1ozVXd3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQUwwYUt1VnpDMlhPWVl0NUZ5WTRvMzVXb2FqNm5DN1cKRGcweFNtWUR5YUNPQWlBYjNoMlYrRmtUaVdDazRtWjZMY3dQZDU5OWcxaXZPQzVSNnhHanBZUlNOQT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
            server: https://kubernetes.default.svc.cluster.local:443
            server: https://10.43.0.1:443
            #server: https://192.168.1.230:6443
          name: default
        contexts:
        - context:
            cluster: default
            user: default
          name: default
        current-context: default
        kind: Config
        preferences: {}
        users:
        - name: default
          user:
            client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrRENDQVRlZ0F3SUJBZ0lJUTQwU2hVMzI1bmd3Q2dZSUtvWkl6ajBFQXdJd0l6RWhNQjhHQTFVRUF3d1kKYXpOekxXTnNhV1Z1ZEMxallVQXhOakEyT0RBd01EazJNQjRYRFRJd01USXdNVEExTWpFek5sb1hEVEl4TVRJdwpNVEExTWpFek5sb3dNREVYTUJVR0ExVUVDaE1PYzNsemRHVnRPbTFoYzNSbGNuTXhGVEFUQmdOVkJBTVRESE41CmMzUmxiVHBoWkcxcGJqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJJeVpKK0dVbERtVHFZOFgKKzA4UysvWTUrcjdaMENqV1pDWURhR0Z3dURJNGJoKzVmbGZ6YXZWWmt2NGhUTVU5eVRsN2RZRm9HS0l4TXlKNwpNNFppVWZpalNEQkdNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUtCZ2dyQmdFRkJRY0RBakFmCkJnTlZIU01FR0RBV2dCUUhQcVBwZGNhZUk4NU9idHZiRUNZLzB2RWVHakFLQmdncWhrak9QUVFEQWdOSEFEQkUKQWlBeURMZW81VUpPWXV5MXY1V2xrVERRMyt5RUhTcEhWWlAxUy9HZ1N5bkpQQUlnT2NxTkxyeEg3WlJYNWVITAphcjNHTkNwcjNoOHRZTENDUkpPVTVOcWJORXc9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkakNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdFkyeHAKWlc1MExXTmhRREUyTURZNE1EQXdPVFl3SGhjTk1qQXhNakF4TURVeU1UTTJXaGNOTXpBeE1USTVNRFV5TVRNMgpXakFqTVNFd0h3WURWUVFEREJock0zTXRZMnhwWlc1MExXTmhRREUyTURZNE1EQXdPVFl3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFRRU9vVWV0SDRqUlBQbTNRSTVNZEJOcy83dCtROUdObklsZDRGU2xEWVQKcDBiS0wwK2hQNk5TT1FvdGxPemQ1Uk9qeGFZTzJIRXdMQTVrQzBJa2IxK2xvMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVUJ6Nmo2WFhHbmlQT1RtN2IyeEFtClA5THhIaG93Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnWFlmT0Q5V1ZFQ1IvNS9jSUFJaUs1emJ3T1lIbFgyR2wKT1I1UGdMdTVRTmtDSUR0N1NhSUM3MGIrUkU0YVBYNHdQb21RdklZUWtncE9BYkpZYW9oWTU3YnoKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
            client-key-data: {{ pillar['network']['cuttlefish']['kubectl-client-key-data'] }}

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
