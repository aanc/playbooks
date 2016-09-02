#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))
source $SCRIPT_DIR/_common.sh

count=$(curl -s 'http://git:8080/gerrit/changes/' | egrep -c '"project": "forge/forge-config-mgt"|"project": "forge/forge-jobs"')
if [[ $count -gt 0 ]]; then
	echo "Gerrit: $count waiting"
	echo
	echo $COLOR_RED_HEX
else
	echo "Gerrit:OK"
	echo
	echo $COLOR_GREEN_HEX
fi
