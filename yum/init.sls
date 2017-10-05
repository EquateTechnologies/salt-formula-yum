{% from "yum/map.jinja" import yum_settings with context %}

{{ yum_settings.lookup.pkg }}:
  pkg.installed

{% for package_name in yum_settings.lookup.extra_pkgs %}
{{ package_name }}:
  pkg.installed
{% endfor %}

{% if yum_settings.get('manage_yum_conf', False) == True %}
/etc/yum.conf:
  file.managed:
    - source: salt://yum/files/yum.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - context:
      yum_settings: {{ yum_settings }}
{% endif %}
