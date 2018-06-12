#!/usr/local/bin/bash

# 1.) move this file to /usr/local/lib/check_mk_agent/plugins/
#
# 2.) in the pfsense webgui in your openvpn server config add as custom parameter: status /var/log/openvpn-status.log
#     this tells openvpn server to create the openvpn status logfile

## stolen from the checkmk linux client
# OpenVPN Clients. Currently we assume that the configuration # is in /etc/openvpn. We might find a safer way to find the configuration later.
if [ -e /var/log/openvpn-status.log ] ; then
    echo '<<<openvpn_clients:sep(44)>>>'
    sed -n -e '/CLIENT LIST/,/ROUTING TABLE/p' < /var/log/openvpn-status.log | sed -e 1,3d -e '$d'
fi


