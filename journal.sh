#!/bin/bash
NOTES="$HOME/Dropbox/Apps/Editorial/_notes/_journal"
if [ $# -eq 0 ]; then
	if [ ! -e "$NOTES/$(date +%Y%m%d).md" ]
	then
		touch "$NOTES/$(date +%Y%m%d).md"
		echo "Created today's journal entry!"
	else
		echo "Today's journal entry already exists!"
	fi
else 
	if [ $# -eq 1 ]; then
		echo $1
	fi
fi
