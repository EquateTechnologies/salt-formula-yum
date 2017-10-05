{% from "yum/map.jinja" import yum_settings with context %}

yum-updateonboot:
  pkg.installed

{% if 'updateonboot' in yum_settings %}
/etc/sysconfig/yum-updateonboot:
  file.managed:
    source: salt://yum/files/sysconfig-updateonboot
    template: jinja
    user: root
    group: root
    mode: 0644
    context:
      - yum_settings {{ yum_settings }}
{% endif %}
