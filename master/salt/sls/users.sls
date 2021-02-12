DavidGroup:
  group.present:
    - name: david
    - gid: 1000

David:
  # TODO: password
  user.present:
    - fullname: David Orchard
    - name: david
    - shell: /bin/fish
    - home: /home/david
    - uid: 1000
    - gid: 1000
    - groups:
        - david
        - sys
        - network
        - power
        - lp
        - wheel
        - docker
        - users
    - require:
      - DavidGroup
      - Fish