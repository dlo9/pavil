base:
  '*':
{#- Look for all .sls files in the master's directory #}
{%- for sls in salt.cp.list_master('base') %}
  {%- if sls != "top.sls" and sls.endswith(".sls") %}
    {#- Remove the extension #}
    {%- set sls = sls | replace('.sls', '') %}
    - {{ sls }}
  {%- endif %}
{%- endfor %}
