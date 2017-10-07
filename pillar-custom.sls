# vim: ft=yaml
# Custom Pillar Data for metricbeat

metricbeat:
  enabled: True
  service:
    name: metricbeat
    state: running
    enable: True
  config:
    metricbeat.modules:
    - module: system
      metricsets:
        - cpu
        - load
        - core
        - diskio
        - filesystem
        - fsstat
        - memory
        - network
        - process
      enabled: true
      period: 10s
      processes: ['.*']
    output.elasticsearch:
      hosts: ["localhost:9200"]
    logging.to_files: true
    logging.files: {}
