metricbeat_mockup_deps:
  pkg.installed:
    - pkgs:
      - haveged

{% if grains.os_family == "Debian" %}
elasticsearch_debian_repo_managed:
  pkgrepo.managed:
    - humanname: Elasticsearch Repo
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elastic-6.x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - refresh_db: True
    
jessie_backports_repo_managed:
  pkgrepo.managed:
    - humanname: Jessie Backports
    - name: deb http://ftp.debian.org/debian jessie-backports main
    - file: /etc/apt/sources.list.d/jessie-backports.list
{% endif %}

{% if grains.os_family == "RedHat" %}
kibana_rhel_repo_managed:
  pkgrepo.managed:
    - humanname: Elasticsearch repository for 6.x packages
    - name: elasticsearch-6.x
    - file: /etc/yum.repos.d/elastic
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - baseurl: https://artifacts.elastic.co/packages/6.x/yum
{% endif %}
