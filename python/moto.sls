{%- if grains['os'] not in ('Windows',) %}
include:
  - python.pip
{%- endif %}

moto:
  pip.installed:
    - name: moto == 0.4.31
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://nexus.c7.saltstack.net/repository/salt-proxy/simple
    - extra_index_url: https://pypi.python.org/simple
{%- if grains['os'] not in ('Windows',) %}
    - require:
      - cmd: pip-install
{%- endif %}
