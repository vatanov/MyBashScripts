#!/bin/bash
filesystem="/dev/mapper/ubuntu--vg-ubuntu--lv"
used_space=`df -h | grep "$filesystem" | awk '{print $5}' | sed 's/%//g'`
free_space=`echo 100-$used_space | bc`
echo "Free space of $filesystem is: $free_space%"
