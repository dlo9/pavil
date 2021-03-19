Generate initramfs:
  cmd.run:
    - name: mkinitcpio -P

{% macro enable_swap_partition(device) -%}
Swap mount for {{ device }}:
  mount.swap:
    - name: {{ device | quote }}

Enable swap for {{ device }}:
  module.wait:
    - mount.swapon:
      - name: device
    - watch:
      - Swap mount for {{ device }}

Enable bootloader swap for {{ device }}:
  file.replace:
    - name: /etc/default/grub
    - pattern: resume=[^ "]*
    - repl: resume={{ device | quote }}
    - append_if_not_found: true
    - not_found_content: GRUB_CMDLINE_LINUX="resume={{ device | quote }}"

Enable initramfs swap for {{ device }}:
  file.replace:
    - name: /etc/mkinitcpio.conf
    - pattern: resume
    - repl: resume
    - append_if_not_found: true
    - not_found_content: HOOKS+=" resume"
    - onchanges_in:
      - Generate initramfs
{%- endmacro %}
