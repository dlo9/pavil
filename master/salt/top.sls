base:
  '*':
{#- Look for all .sls files in the master's directory -#}
{% for sls in salt.cp.list_master('base') %}
	{#- Remove the extension -#}
	{%- set sls = sls | replace('.sls', '') -%}
	{#- Only include those under sls/ -#}
	{%- if sls != "top" %}
    - {{ sls }}
	{%- endif -%}
{%- endfor -%}
