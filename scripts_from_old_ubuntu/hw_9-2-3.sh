#!/bin/bash

while true
do
	rand=`awk 'BEGIN {srand(); print int(rand()*10)}'`
	sleep $rand
	#echo $rand
	fortune
done
