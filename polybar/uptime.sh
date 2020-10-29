#!/bin/sh

days=$(uptime | grep day)
early=$(uptime | grep min | grep day)
num=2

if [ ! -z "$days" ] 
then
	num=$(($num+1))	
fi
if [ ! -z "$early" ] 
then 
    last="user"
else
    last=""
fi

uptime | awk '{print $2 " " $3 " " $4 " " $5 " " $6 " " $7}' | cut -d ',' -f -$num | tr -d '\n' && echo " $last"
