#!/usr/bin/python3
# this code is for current server time
# location /var/www/cgi-bin

import cgitb
import datetime

cgitb.enable()

now = datetime.datetime.now()
print ("content-Type: text/html")
print ("")
print ("current prod-autoserv date/time:")
print (now.strftime("%Y-%m-%d %H:%M:%S"))

