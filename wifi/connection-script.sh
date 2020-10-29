#!/bin/bash
# connect to wifi with wpa_supplicant
pkill wpa_supplicant
pkill dhcpcd

ip link set dev <device> up
wpa_supplicant -B -i <device> -c <path to wifi config>/<config>.conf
dhcpcd <device>
