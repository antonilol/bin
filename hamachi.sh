#!/bin/bash

if systemctl status logmein-hamachi > /dev/null; then
	sudo ip route del 255.255.255.255/32 dev ham0
	sudo systemctl stop logmein-hamachi
	echo -e 'stopped hamachi and removed ham0'
else
	sudo systemctl start logmein-hamachi
	sleep 0.5
	sudo ip route add 255.255.255.255/32 dev ham0
	echo -e 'started hamachi and created ham0'
fi
