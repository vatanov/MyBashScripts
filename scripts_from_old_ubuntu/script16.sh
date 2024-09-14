#!/bin/bash
for i in $(ls /etc)
do
	if [ -f /etc/$i ]
	then
		#echo $i
		wc -l /etc/$i
	fi
done

# Correct solution:
directory="/etc/"

find "$directory" -maxdepth 1 -type f |
	while read filename
	do
		if [ -f "$filename" ]
		then
			wc -l "$filename"
		fi
	done
