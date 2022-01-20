#!/bin/bash

# To run as background process use following command
# nohup ./ctrl-cronjob.sh >/dev/null 2>&1 &

# To kill the background process use following command
# ps ax | grep ctrl-cronjob-start.sh
# Ignore the grep --color=auto process and check Process ID of the other process
# Do kill -9 <process-id>

# To check log when last command was run use following command:
# cat $HOME/ctrl-cronjob/ctrl-cronjob.log

DIRECTORY_PATH="$HOME/ctrl-cronjob"
FILE_PATH="$DIRECTORY_PATH/ctrl-cronjob.log"
MESSAGE_PREFIX="Command execution done at:"
SLEEP_SECONDS=10

#------------------------------------------#
# Create a directory if it does not exist. #
#------------------------------------------#
# Note the "-p" option in the mkdir        #
# command which creates directories        #
# recursively.                             #
#------------------------------------------#
createDirectory() {
	mkdir -p -- "$1"
}

executeCommand() {
	echo "$MESSAGE_PREFIX $(date +"%d-%m-%Y %T.%N %Z")" > $FILE_PATH
	xdotool key ctrl
}

runScript() {
	createDirectory $DIRECTORY_PATH
	executeCommand
}

runLoop() {
	while true
	do
	 runScript
	 sleep $SLEEP_SECONDS
	done
}

runLoop
