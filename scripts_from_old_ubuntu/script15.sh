#!/bin/bash
#Wrong solution
: '
#test -x filename
for i in $(ls /usr/bin)
do
	if [ ! -d "/usr/bin/$i" ] && [ -x "/usr/bin/$i" ]
	then
		echo /usr/bin/$i
	fi
done
'
# Correct solution
directory="/usr"

find $directory -type f |
while read line
do
	if [ -x "$line" ]
	then
		echo "$line"
	else
		continue
	fi
done

