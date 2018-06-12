#!/usr/local/bin/bash

# 1.) move this file to /usr/local/lib/check_mk_agent/plugins/
#
# 2.) # and make it executable: chmod +x /usr/local/lib/check_mk_agent/plugins/openvpn.sh
#
# 3.) in the pfsense webgui in your openvpn server config add as custom parameter: status /var/log/openvpn-status.log
#     this tells openvpn server to create the openvpn status logfile

## stolen from the checkmk linux client:
if [ -e /var/log/openvpn-status.log ] ; then
    echo '<<<openvpn_clients:sep(44)>>>'
    sed -n -e '/CLIENT LIST/,/ROUTING TABLE/p' < /var/log/openvpn-status.log | sed -e 1,3d -e '$d'
fi


