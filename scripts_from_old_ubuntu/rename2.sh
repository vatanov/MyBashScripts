#!/bin/bash
n=1
while [ $n -le 9 ]
do
	rm script$n.sh script0$n.sh
	n=$(($n + 1))
done
