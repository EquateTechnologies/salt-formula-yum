# salt-formula-yum
Install and configuration additional aspects of yum package manager

# Available States

yum - ensure back package and additional packages such as plugins are installed; configures /etc/yum.conf
yum.cron - install yum-cron package and configure daily and hourly updates
yum.updateonboot - install yum-updateonboot package and configure options
yum.repos - configure and removes repos based on pillar
