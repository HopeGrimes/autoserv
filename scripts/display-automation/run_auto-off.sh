!/bin/bash

# location:
# /opt/scripts/display-automation/run_auto-off.sh

/opt/scripts/display-automation/auto-off.sh
/opt/scripts/display-automation/tv_auto-off.sh

echo -e "\n\n" >> /opt/log/display-automation.log
date +%F_%H%M%S >> /opt/log/display-automation.log
echo "Ran auto-off script." >> /opt/log/display-automation.log

#EOF
