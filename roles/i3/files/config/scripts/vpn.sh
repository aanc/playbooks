#!/bin/bash

vpn_status_file=~/.ovpn/status.log

humanize () {
	local val=$1
	local count=0
	declare -a suffix=(B K M G T P)

	while [[ $val -gt 1000 ]]
	do
		val=$(( $val / 1024 ))
		count=$(( count + 1 ))
	done

	echo "${val}${suffix[$count]}"
}

if ip a show tun0 &>/dev/null
then
	if [[ -r $vpn_status_file ]]
	then
		r=$(grep "TCP/UDP read bytes" $vpn_status_file | cut -d',' -f2)
		w=$(grep "TCP/UDP write bytes" $vpn_status_file | cut -d',' -f2)
		t=$(humanize $((w + r)))
	    echo "VPN:$t"
	else
		echo "VPN:Up"
	fi
	echo
	echo \#ffffff
else
	echo "VPN:Down"
	echo
	echo \#cc5b5b
fi
