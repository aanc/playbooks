#!/bin/bash

color=\#d03f3f
for iface in $(grep -Hs "1" /sys/class/net/wl*/carrier | cut -d/ -f5)
do
  essid=$(iwgetid | grep "^$iface" | sed -r -e 's/.*ESSID:"(.*)"/\1/g')
  [[ -n $essid ]] && color=\#ffffff || essid="disconnected"
  echo -n "$essid"
done

echo
echo
echo $color
