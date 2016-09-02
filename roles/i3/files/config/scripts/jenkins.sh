#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))
source $SCRIPT_DIR/_common.sh
source $SCRIPT_DIR/_firefox.sh

wallURL="http://forge/ic/view/_FDXT_DSL/view/Exploitation/view/Wall/"
jobsURL="http://forge/ic/job/"

wall=$(curl -s $wallURL | sed -e "s|</div>|</div>\n|g" | grep 'class="job' | sed -r -e 's|^.* tooltip="(.*)" .* class="job ([a-z]*) .*$|\1:\2|')
failed=$(egrep -o "failing|claimed" <<< "$wall" | wc -l)

if [[ -n $BLOCK_BUTTON ]]; then
	jobName=$(egrep "failing|claimed" <<< "$wall" | tr ':' '\n' | yad --list --column="Job" --column="Status" --width=500 --height=200 --no-buttons --mouse --on-top --undecorated --skip-taskbar | cut -d'|' -f1)
	[[ -n $jobName ]] && firefox::open_in_new_tab ${jobsURL}/${jobName} &>/dev/null
fi
[[ -z $wall ]] && echo "Jenkins" && echo && echo \#d03f3f && exit 0


if [[ $failed -gt 0 ]]; then
	echo "Jenkins:$failed KO"
	echo
	echo $COLOR_RED_HEX
else
	echo 'Jenkins:OK'
	echo
	echo $COLOR_GREEN_HEX
fi
