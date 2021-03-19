Systemd reload:
  cmd.run:
    - name: systemctl --system daemon-reload

Restart systemd automount service:
  service.running:
    - name: remote-fs.target
    - enable: true

{% macro mount_share(host, name, workgroup, user, pass) -%}
Samba credentials for {{ name | quote }}:
  file.managed:
    - name: /etc/fstab.d/{{ name | quote }}.credentials.smb
    - user: {{ user | quote }}
    - group: {{ user | quote }}
    - makedirs: true
    - contents: |
        username={{ user }}
        password={{ pass }}
        domain={{ workgroup }}

Samba mount for {{ name | quote }}:
  pkg.installed:
    - pkgs:
      - cifs-utils
  mount.mounted:
    - name: /mnt/{{ name | quote }}
    - device: //{{ host | quote }}/{{ name | quote }}
    - fstype: cifs
    - mkmnt: True
    - opts:
      - _netdev
      - noauto
      - user={{ user | quote }}
      - exec
      - uid={{ user | quote }}
      - gid={{ user | quote }}
      - nofail
      - credentials=/etc/fstab.d/{{ name | quote }}.credentials.smb
      - x-systemd.automount
      - x-systemd.mount-timeout=30
    - onchanges_in:
      - Restart systemd automount service
      - Systemd reload
{%- endmacro %}
