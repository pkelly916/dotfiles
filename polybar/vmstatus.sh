#!/bin/sh
# show name and ip on active virtual machines

# virsh access
conn="--connect qemu:///system"

# get vm name from virsh list
names=$(virsh $conn list | awk '{print $2}' | grep -v "Name")

if [ ! -z "${names[0]}" ]
then
    # append ips to vm names
    i=0
    for n in ${names[@]}; do
        mac=$(virsh $conn domiflist $n | grep vnet | awk '{print $5}')
        ip=$(arp -n | grep $mac | awk '{print $1}')
        names[i]="$n - $ip | "
        i=$(($i+1))
    done

    # remove last bar
    n=${names[$(($i-1))]}
    names[$(($i-1))]=$(echo $n | tr -d "|")
fi

echo ${names[@]}
