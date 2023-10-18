#!/bin/bash

echo "content-type: text/html"
echo ""

# location /var/www/cgi-bin
echo -n -e "ka 00 00\x0d" | nc -N 10.120.24.87 9761

#EOF

