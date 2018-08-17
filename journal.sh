#!/bin/bash
NOTES="$HOME/Dropbox/Apps/Editorial/_notes/_journal"
if [ ! -e "$PWD/.journalrc" ]; then touch "$PWD/.journalrc"; fi
rc=$PWD/.journalrc
if [ $# -eq 0 ]; then
	echo "Usage: journal [command]"
else 
	if [ $1 = 'today' ]; then 
		if [ ! -e "$NOTES/$(date +%Y%m%d).md" ]
		then
			touch "$NOTES/$(date +%Y%m%d).md"
			echo "Created today's journal entry!"
		else
			echo "Today's journal entry already exists!"
		fi
	fi
	if [ $1 = 'init' ]; then
		hash=$(echo $PWD | md5)
		if [ ! $(grep -co $hash $rc) -eq 0 ]; then
			echo "fatal: Already a journal at \"$PWD\""
		else
			echo $hash >> $rc
			echo "Initialized new journal at \"$PWD\""
		fi
	fi
fi
