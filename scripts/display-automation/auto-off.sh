#!/bin/bash

# location:
# /opt/scripts/display-automation/auto-off.sh

# CTR Projector

wget -o /dev/null -O /dev/null "http://10.120.24.81/cgi-bin/raw.pl?cmd=%02POF%03"

# North GS TV

wget -o /dev/null -O /dev/null "http://10.120.24.82/cgi-bin/raw.pl?cmd=POWR0000%0D"

# South GS TV

wget -o /dev/null -O /dev/null "http://10.120.24.83/cgi-bin/raw.pl?cmd=POWR0000%0D"

# WC Fill TV
python /var/www/cgi-bin/tv-control.cgi wc_hltvOFF
# python /var/www/cgi-bin/tv-control.cgi wc_hrtvOFF

# WC Foldback TV
