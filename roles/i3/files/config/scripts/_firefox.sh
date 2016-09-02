#!/bin/bash
#
# Controls firefox using MozRepl extension
#

MOZREPL_PORT=4242

send_cmd () {
	local command="$*"
	nc localhost $MOZREPL_PORT <<< "$command" | tee -a /tmp/logzzz
}

firefox::open_new_tab () {
	send_cmd "gBrowser.addTab()"
	send_cmd "length = gBrowser.tabContainer.childNodes.length"
	send_cmd "gBrowser.selectedTab = gBrowser.tabContainer.childNodes[length-1]"
}

firefox::load_url_in_current_tab () {
	local url=$1
	send_cmd "content.location.href = '$url'"
}

firefox::open_in_new_tab () {
	local url=$1
	firefox::open_new_tab
	firefox::load_url_in_current_tab $url
}
