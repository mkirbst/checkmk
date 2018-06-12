#!/usr/local/bin/bash

# move this file to /usr/local/lib/check_mk_agent/plugins/ 
# and make it executable: chmod +x /usr/local/lib/check_mk_agent/plugins/lnx-thermal.sh
#
## stolen from the checkmk linux client
if sysctl -a | grep temperature >/dev/null 2>&1; then
        echo '<<<lnx_thermal>>>'
        ##desc:   | only temps       | replace strange chars by _ | format the output and tell cmk the limits of our hardware
        sysctl -a | grep temperature | sed 's/[^ a-zA-Z0-9-]/_/g' | awk '{ print $1 " enabled acpitz " $2*1000 " 100000 critical 95500 passive"}'
fi

