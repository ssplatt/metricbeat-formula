# vim: ft=sls
{% from "metricbeat/map.jinja" import metricbeat with context %}

metricbeat_pkg:
  pkg.installed:
    - name: {{ metricbeat.pkg }}
