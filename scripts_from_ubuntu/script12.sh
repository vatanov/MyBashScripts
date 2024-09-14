#!/bin/bash
for i in google.com amazon.com fb.com x.com
do
	ping -c4 -q $i &> /dev/null && echo "$i is available" || echo "$i is unreachable!"
done
