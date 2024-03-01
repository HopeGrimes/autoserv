#!/bin/bash
read var

echo "command=" $var >> /etc/xinetd_testlog.txt

# from bss stuff
	if [ $var = "all_on" ];
		then ./var/www/cgi-bin/tv-control.cgi allON
	elif [ $var = "all_off" ];
		then ./var/www/cgi-bin/tv-control.cgi allOFF
	elif [ $var = "wc_on" ];
		then ./var/www/cgi-bin/tv-control.cgi wcON
	elif [ $var = "wc_off" ];
		then ./var/www/cgi-bin/tv-control.cgi wcOFF
	elif [ $var = "atrium_on" ];
		then ./var/www/cgi-bin/tv-control.cgi atriumON
	elif [ $var = "atrium_off" ];
		then ./var/www/cgi-bin/tv-control.cgi atriumOFF

#	else echo "something isn't working" >> /etc/xinetd_testlog.txt
fi

#EOF
