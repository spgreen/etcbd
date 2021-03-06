#!/bin/bash

# set required permissions on mounted volumes

chown -R nagios.adm /var/log/icinga2
chmod -R g+w /var/log/icinga2

chown -R nagios.nagios /var/lib/icinga2

mkdir -p /var/run/icinga2/cmd
chown -R nagios.nagios /var/run/icinga2

# make /var/run/icinga2/cmd group-writeable by Apache (www-data)
chgrp -R www-data /var/run/icinga2/cmd
chmod g+rwxs /var/run/icinga2/cmd

