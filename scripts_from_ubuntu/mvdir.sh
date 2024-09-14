#!/bin/bash
if [ $# -ne 2 ]
then
	echo "2 arguments needed, dir to be moved and destination dir"
	exit 1
fi

# check if dir exists
if [ ! -d "$1" ]
then
	echo "Error! $1 does not exist or not a directory"
	exit 1
fi

# check if dest dir exists
if [ ! -d "$2" ]
then
        echo "Error! $2 does not exist or not a directory"
	exit 1
fi

# Delete only if dir successfully copied
if cp -r "$1" "$2" && rm -r "$1"
then
	echo "Dir $1 was moved to dir $2"
	exit 0
else
	echo "Error! Something went wrong!"
	exit 1
fi
