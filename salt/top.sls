base:
  '*':
    {% set root_dir = salt.config.get('file_roots').base[0] %}
    {% set search_dir = root_dir + "/sls/" %}
    {% for sls in salt.file.find(search_dir, iname='*.sls', type='f') %}
    - {{ sls | replace(root_dir, "") | replace(".sls", "") }}
    {% endfor %}
