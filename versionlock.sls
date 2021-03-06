{% if salt['grains.get']('os', '') == 'Fedora' %}
include:
  - update_dnf

versionlock:
  cmd.run:
    - name: "dnf install -y python-dnf-plugins-extras-versionlock python3-dnf-plugins-extras-versionlock"
    - require:
      - cmd: update_dnf
{% endif %}
