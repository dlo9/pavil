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

Docker:
  pkg.installed:
    - pkgs:
      - docker
      - docker-compose
  service.running:
    - name: docker
    - enable: true

Fish:
  pkg.installed:
    - pkgs:
      - fish
