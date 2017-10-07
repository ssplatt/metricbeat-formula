# vim: ft=sls
{% from "metricbeat/map.jinja" import metricbeat with context %}

metricbeat_config:
  file.managed:
    - name: /etc/metricbeat/metricbeat.yml
    - source: salt://metricbeat/files/metricbeat.yml.j2
    - user: root
    - group : root
    - mode: 0644
    - template: jinja
