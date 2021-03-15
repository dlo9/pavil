Systemd reload:
  cmd.run:
    - name: systemctl --system daemon-reload
    - watch:
      - file: /etc/fstab

Restart systemd automount service:
  service.running:
    - name: remote-fs.target
    - enable: true
    - watch:
      - file: /etc/fstab

{% macro mount_share(host, name, workgroup, user, pass) -%}
Samba share mount for {{ name | quote }}:
  file.directory:
    - name: /mnt/{{ name | quote }}
    - user: {{ user | quote }}
    - group: {{ user | quote }}

Samba share credentials for {{ name | quote }}:
  file.managed:
    - name: /etc/fstab.d/{{ name | quote }}.credentials.smb
    - user: {{ user | quote }}
    - group: {{ user | quote }}
    - makedirs: true
    - contents: |
        username={{ user }}
        password={{ pass }}
        domain={{ workgroup }}

Samba share for {{ name | quote }}:
  pkg.installed:
    - pkgs:
      - cifs-utils
  file.replace:
    - name: /etc/fstab
    - append_if_not_found: true
    - pattern: .*/mnt/{{ name | regex_escape | quote }}.*
    - repl: //{{ host | quote }}/{{ name | quote }} /mnt/{{ name | quote }} cifs _netdev,noauto,user,exec,uid={{ user | quote }},gid={{ user | quote }},nofail,credentials=/etc/fstab.d/{{ name | quote }}.credentials.smb,x-systemd.automount,x-systemd.mount-timeout=30 0 0
{%- endmacro %}
