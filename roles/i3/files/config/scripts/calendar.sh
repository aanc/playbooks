#!/bin/bash

if [[ -z $BLOCK_BUTTON ]]; then
	# First part of if is what we cant to be displayed in the block
	date '+   %d/%m/%Y   %H:%M'
else
	# The else part is what we want to do when the block is clicked
	yad --calendar --no-buttons --mouse --on-top --undecorated --skip-taskbar
fi
