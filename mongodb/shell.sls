{% from "mongodb/map.jinja" import shell with context %}

mongoshell_package:
{% if shell.use_ppa or shell.use_repo %}
  {% set os = salt['grains.get']('os')|lower %}
  {% set code = salt['grains.get']('oscodename') %}
  pkgrepo.managed:
    - humanname: MongoDB.org Repo
    - name: deb http://repo.mongodb.org/apt/{{ os }} {{ code }}/mongodb-org/{{ shell.version }} {{ shell.repo_component }}
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
{% endif %}
  pkg.installed:
    - name: {{ shell.mongoshell_package }}
