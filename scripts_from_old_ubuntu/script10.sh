#!/bin/bash
i=0
while [ $i -lt 10 ]
do
	fortune | tail --lines=1 >> quotes.txt
	i=$(($i + 1))
done

l=1
while read line
do
	echo "Line $l: $line"
	l=$(($l + 1))
done < quotes.txt
