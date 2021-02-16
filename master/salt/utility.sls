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

Terminal:
  pkg.installed:
    - pkgs:
      - tmux

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
