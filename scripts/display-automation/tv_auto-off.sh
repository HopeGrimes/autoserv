#!/bin/bash

# location:
# /opt/scripts/projector-automation/tv_auto-off.sh

# South Atrium TV
wget -o /dev/null -O /dev/null "http://10.120.24.82/cgi-bin/raw.pl?cmd=POWR0000%0D"

# North Atrium TV 
wget -o /dev/null -O /dev/null "http://10.120.24.83/cgi-bin/raw.pl?cmd=POWR0000%0D"
