#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
	con=$(ps -C openvpn -o command= | rev | awk '{print $1}' | cut -d '/' -f 1 | rev | cut -d '.' -f 1)
	echo "active - $con"
elif [ "$(pgrep openconnect)" ]; then
	con=$(ps -C openconnect -o command= | cut -d ' ' -f 2)
	echo "active - $con"
else
	echo "inactive"
fi
