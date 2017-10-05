{% from "yum/map.jinja" import yum_settings with context %}

{% if 'repo' in yum_settings %}
{% if 'absent' in yum_settings.repo %}
{% for repo_name, values in yum_settings.repo.absent %}
repo-absent-{{ repo_name }}:
{% if values == None %}
  pkgrepo.absent
{% else %}
  pkgrepo.absent:
{% for name, value in values %}
    {{ name }}: {{ value }}
{% endfor %}
{% endif %}
{% endfor %}
{% endif %}

{% if 'managed' in yum_settings.repo %}
{% for repo_name, values in yum_settings.repo.managed %}
{% if values != None %}
repo-managed-{{ repo_name }}:
  pkgrepo.managed:
{% for name, value in values %}
    {{ name }}: {{ value }}
{% endfor %}
{% endif %}
{% endfor %}
{% endif %}

{% endif %}
