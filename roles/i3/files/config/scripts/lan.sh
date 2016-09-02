#!/bin/bash

color=\#d03f3f
for iface in $(grep -Hs "1" /sys/class/net/eno*/carrier /sys/class/net/eth*/carrier | cut -d/ -f5)
do
  speed=$(ethtool eno1 2>/dev/null | grep Speed | tr -d " " | cut -d: -f2)
  echo -n "$speed"
  color=\#ffffff
done

echo
echo
echo $color
