{% from "yum/map.jinja" import yum_settings with context %}

yum-cron:
  pkg.installed

{% if 'cron' in yum_settings %}
{% if 'daily' in yum_settings.cron %}
/etc/yum/yum-cron.conf:
  file.managed:
    source: salt://yum/files/yum-cron.conf
    template: jinja
    user: root
    group: root
    mode: 0644
    context:
      yum_cron_settings {{ yum_settings.cron.daily }}
{% endif %}

{% if 'hourly' in yum_settings.cron %}
/etc/yum/yum-cron-hourly.conf:
  file.managed:
    source: salt://yum/files/yum-cron.conf
    template: jinja
    user: root
    group: root
    mode: 0644
    context:
      yum_cron_settings {{ yum_settings.cron.hourly }}
{% endif %}
{% endif %}
