#!/usr/bin/perl -w

## This script generally lives at:
## /var/www/cgi-bin/raw.pl

use warnings;
use strict;
use CGI;
use Device::SerialPort;

#use PackingBytes;


# calling it PJ because ProJector
our $pj = Device::SerialPort -> new ("/dev/ttyS0");

sub setupPJ {
        $pj -> baudrate(19200);
        $pj -> parity('none');
        $pj -> databits(8);
        $pj -> stopbits(1);
#       $pj -> handshake('none');
#       $pj -> write_settings;
        $pj -> read_char_time(0);
        $pj -> read_const_time(250);
}
setupPJ;


#my $cgi = CGI -> new;
my $cgi = new CGI;
my $value = $cgi -> param('cmd');



## FOR EXTRON COMPATIBILITY
## STRIP THE 'W01RS|' IF IT
## EXISTS IN THE STRING

$value =~ s/^W01RS\|//i;

#####



# use one of these two:
#$value = packing($value);
$value =~ s/%../pack('C', hex($1))/g;


$pj -> write($value);
my $retValue = $pj -> read(255);


print (
	$cgi -> header,
	#$cgi -> h1("\n".$retValue."\n")
);
print $retValue;
