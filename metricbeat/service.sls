# vim: ft=sls
{% from "metricbeat/map.jinja" import metricbeat with context %}

metricbeat_service:
 service.{{ metricbeat.service.state }}:
   - name: {{ metricbeat.service.name }}
   - enable: {{ metricbeat.service.enable }}
   - watch:
       - file: metricbeat_config
