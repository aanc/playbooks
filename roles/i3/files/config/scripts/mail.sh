#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -f $0))
source $SCRIPT_DIR/_mail.sh

if [[ -z $BLOCK_BUTTON ]]; then
  inboxMailCount=$(ls ~/Mail/*/INBOX/new/* ~/Mail/*/INBOX/cur/* | wc -l)
  echo "Inbox:$inboxMailCount"
else
  numLines=$(get_inbox_subjects | wc -l)
  get_inbox_subjects | rofi -dmenu -no-fullscreen -font "DejaVu Sans Mono 10" -p "Inbox mails:" -padding 2 -location 3 -yoffset 24 -lines $numLines
fi
