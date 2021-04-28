IDE:
  pkg.installed:
    - pkgs:
      - code

{% import 'lib/aur.sls' as aur with context %}
{{ aur.install("code-marketplace") }}

Version Control:
  pkg.installed:
    - pkgs:
      - git
  file.managed:
    - name: /home/david/.gitconfig
    - user: david
    - group: david
    - contents: |-
        [user]
              email = if_coding@fastmail.com
              name = David Orchard
              username = dlo9
        [push]
            default = simple
        [credential]
            helper = cache --timeout 3600

Debugging:
  pkg.installed:
    - pkgs:
      - strace
      - gdb

Virtualization:
  pkg.installed:
    - pkgs:
      - qemu
      - docker
      - docker-compose
  service.running:
    - name: docker
    - enable: true

Rust:
  pkg.installed:
    - pkgs:
      - rustup

Python:
  pkg.installed:
    - pkgs:
      - python-pip

NPM:
  pkg.installed:
    - pkgs:
      - npm
