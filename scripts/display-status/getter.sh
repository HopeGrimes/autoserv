#!/bin/bash

# location: /opt/scripts/display-status

i="0"

while [ $i -eq 0 ]
do

panasonic='panasonicPJLink'
autoserv='autoservPJLink'
panasonicPWR='%02QPW%03'
panasonicLAMP1='%02Q$L:1%03'
panasoincLAMP2='%02Q$L:2%03'
lgTVPWR='ka%200%20FF%0D'

wc_main='http://10.120.24.81/cgi-bin/raw.pl?cmd='
# wc_fb='http://10.120.24.***/cgi-bin/raw.pl?cmd='

# WC Projector Status
statusWCPJ=$(curl $wc_main$panasonicPWR)
	statusWCPJ1=$(echo $statusWCPJ | sed 's/[^[:print:]]//g')
echo $statusWCPJ1
	if [ $statusWCPJ1 == '000' ]
		then echo OFF > /var/www/html/wc1.txt
	elif [ $statusWCPJ1 == '001' ]
		then echo ON > /var/www/html/wc1.txt
	elif  [ $statusWCPJ1 == '002' ]
		then echo COOLING > /var/www/html/wc1.txt
	else echo ERROR > /var/www/html/wc1.txt
fi

sleep 5
done

#EOF
