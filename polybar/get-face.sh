ps aux | grep -m 1 dhcpcd | grep -v "grep" | awk '{print $12}'
