#!/bin/bash
while true; do
    dd if=/dev/urandom of=/dev/fb0
    read -t 0.05 -n 1 input
    if [ ! -z "$input" ]; then
        break
    fi
done
physlock
