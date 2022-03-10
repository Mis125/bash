#!/bin/bash

interfaces=()
for web in $(ifconfig | cut -d ' ' -f1 | tr ':' '\n' | awk NF); do
	if [ "$web" != "lo" ]; then
		interfaces+=("$web")
	fi
done


for inter in ${interfaces[@]}; do
echo $inter
echo "Status:  $(cat /sys/class/net/$inter/operstate)"
echo "MAC: $(cat /sys/class/net/$inter/address)"
echo "IP: $(hostname -I)"
done
