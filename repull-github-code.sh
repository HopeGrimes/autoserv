#!/bin/bash
# lives at:
# ~/repull-github-code.sh
rm -rf ~/projectdir
git clone git@github.com:HopeGrimes/autoserv.git ~/projectdir
chmod +x ~/projectdir/deploy.sh
echo "done! -jbrees"
#EOF
