#!/usr/bin/python
# use this code for turning TV's on or off

import cgitb
import urllib2
import time
from datetime import datetime
import sys
import socket
cgitb.enable()
from wakeonlan import send_magic_packet
# from Crypto.Cipher import AES

print 'content-type: text/html\r\n'

cmd = sys.argv[1]
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# RPi's and device IP's
wc_fbTV = '10.120.24.87'
wc_hlTV = '10.120.24.88'
wc_hrTV = '10.120.24.89'
atrium1url = 'http://10.120.24.83/cgi-bin/raw.pl?cmd='
atrium2url = 'http://10.120.24.82/cgi-bin/raw.pl?cmd='

# serial commands
lgPION = 'POWR0001%0D'
lgPIOFF = 'POWR0000%0D'

# concatate PI variables
atrium1on = atrium1url + lgPION + '\r'
atrium1off = atrium1url + lgPIOFF + '\r'
atrium2on = atrium1url + lgPION + '\r'
atrium2off = atrium1url + lgPIOFF + '\r'

PORT = 9761
lgTVON = 'ka 00 01'
lgTVOFF = 'ka 00 00'
fblgTVOFF = 'POWER off'

# here we are going to define the log file that we will use for troubleshooting and stuff
def log(txt):
	date = datetime.now().strftime("%H:%M_%m/%d?%y")
	f = open('/opt/scripts/display-automation/display-automation'+'.log', "a")
	f.write(date +'\tcommand=['+ cmd +']\t\t'+ txt +'\r\n')
	f.close

# define additional functions

def wcfbtvON():
# if cmd == 'wc_fbtvON':
#	log('WC FB TV on')
	send_magic_packet('b0:37:95:21:0e:7f')

def wcfbtvOFF():
	#	log('WC FB TV off')
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(5)
	sock.connect((wc_fbTV, PORT))
	sock.sendall(lgTVOFF + '\r')
	msg = sock.recv(9761)
	print msg
	sock.close()

def wchltvON():
#	log('WC HL TV on')
	send_magic_packet('7c:64:6c:a1:2c:45')

def wchltvOFF():
#	log('WC HL TV off')
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(5)
	sock.connect((wc_hlTV, PORT))
	sock.sendall(lgTVOFF + '\r')
	msg = sock.recv(9761)
	print msg
	sock.close()

# def wchrtvON():
#	log('WC HR TV on')
#	send_magic_packet('7c:64:6c:**:**:**')

def wchrtvOFF():
#	log('WC HR TV off')
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(5)
	sock.connect((wc_hrTV, PORT))
	sock.sendall(lgTVOFF + '\r')
	msg = sock.recv(9761)
	print msg
	sock.close()

if cmd == 'allON':
	wcfbtvON()
	wchltvON()
#	wchrtvON()
	contents = urllib2.urlopen(atrium1url+lgPION).read()
	time.sleep(1)
	contents = urllib2.urlopen(atrium2url+lgPION).read()
	time.sleep(1)

elif cmd == 'allOFF':
	wcfbtvOFF()
	wchltvOFF()
	wchrtvOFF()
	contents = urllib2.urlopen(atrium1url+lgPIOFF).read()
	time.sleep(1)
	contents = urllib2.urlopen(atrium2url+lgPIOFF).read()
	time.sleep(1)

elif cmd == 'wcON':
	wcfbtvON()
	wchltvON()
#	wchrtvON()

elif cmd == 'wcOFF':
	wcfbtvOFF()
	wchltvOFF()
#	wchrtvOFF()

elif cmd == 'atriumON':
	contents = urllib2.urlopen(atrium1url+lgPION).read()
	time.sleep(1)
	contents = urllib2.urlopen(atrium2url+lgPION).read()
	time.sleep(1)

elif cmd == 'atriumOFF':
	contents = urllib2.urlopen(atrium1url+lgPIOFF).read()
	time.sleep(1)
	contents = urllib2.urlopen(atrium2url+lgPIOFF).read()
	time.sleep(1)

elif cmd == 'wc_fbtvON':
#	log('WC FB TV on')
	send_magic_packet('b0:37:95:21:0e:7f')

elif cmd == 'wc_fbtvOFF':
#	log('WC FB TV off')
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(5)
	sock.connect((wc_fbTV, PORT))
	sock.sendall(lgTVOFF + '\r')
	msg = sock.recv(9761)
	print msg
	sock.close()

elif cmd == 'wc_hltvON':
#	log('WC HL TV on')
	send_magic_packet('7c:64:6c:a1:2c:45')

elif cmd == 'wc_hltvOFF':
#	log('WC HL TV off')
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.settimeout(5)
	sock.connect((wc_hlTV, PORT))
	sock.sendall(lgTVOFF + '\r')
	msg = sock.recv(9761)
	print msg
	sock.close()

#elif cmd == 'wc_hrtvON':
#	log('WC HL TV on')
#	send_magic_packet('7c:64:6c:a1:2c:45')

#elif cmd == 'wc_hrtvOFF':
#	log('WC HL TV off')
#	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#	sock.settimeout(5)
#	sock.connect((wc_hrTV, PORT))
#	sock.sendall(lgTVOFF + '\r')
#	msg = sock.recv(9761)
#	print msg
#	sock.close()


else:
	print ('no match for command')
