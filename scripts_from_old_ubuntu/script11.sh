#!/bin/bash
i=0

while [ $i -le 6 ]
do
	date=`date +%Y%m%d_%H%M`
	mkdir /tmp/directory-$date &> /dev/null
	i=$(($i + 1))
	sleep 420
done
