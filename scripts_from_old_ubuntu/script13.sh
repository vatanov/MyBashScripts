#!/bin/bash
rm -f quotes.txt

for ((i=1;i<=10;i++))
do
	echo "Line $i: $(fortune -n 25)" >> quotes.txt
done

