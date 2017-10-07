# vim: ft=sls
{% from "metricbeat/map.jinja" import metricbeat with context %}

{% if metricbeat.enabled %}
include:
  - metricbeat.install
  - metricbeat.config
  - metricbeat.service
{% else %}
'metricbeat-formula disabled':
  test.succeed_without_changes
{% endif %}
