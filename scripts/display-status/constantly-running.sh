#!/bin/bash

# file location: /opt/scripts/display-status

pkill getter.sh
sleep 3
pkill getter.sh
sleep 3
/opt/scripts/display-status/getter.sh
exit

