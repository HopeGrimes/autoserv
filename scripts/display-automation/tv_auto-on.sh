#!/bin/bash

# location:
# /opt/scripts/display-automation/auto-off.sh

# North GS TV

wget -o /dev/null -O /dev/null "http://10.120.24.82/cgi-bin/raw.pl?cmd=POWR0001%0D"

# South GS TV

wget -o /dev/null -O /dev/null "http://10.120.24.83/cgi-bin/raw.pl?cmd=POWR0001%0D"

