#!/bin/bash
STATE=$(cat /tmp/polybar-ip-state)
INTERFACE=$(/home/pilot/.config/polybar/get-face.sh)

public=$(curl --limit-rate 1k -s ipinfo.io/ip)
private=$(ip a | grep $INTERFACE | grep 'inet' | cut -d '/' -f1 | cut -d 't' -f2 | cut -d ' ' -f2)
# noconn=$(pgrep dhcpcd && pgrep wpa_supplicant)

if [ -z $private ]; then
	echo not connected
elif [ $public == $private ]; then
	echo $public
else
	if [ $STATE == 'public' ]; then
		echo $public
		echo "private" > /tmp/polybar-ip-state
	else 
		echo $private
		echo "public" > /tmp/polybar-ip-state
	fi
fi
