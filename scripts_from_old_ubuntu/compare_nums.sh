#!/bin/bash
read -p "Enter 3 digits devided with Spaces: " a b c

if [ "$a" -gt "$b" ]
then
	if [ "$a" -gt "$c" ]
	then
		echo "$a is the greatest number"
		exit 0
	elif [ "$c" -gt "$a" ]
	then
		echo "$c is the greatest number"
                exit 0
	else
		echo "$a and $c are equal and the greatest numbers"
                exit 0
	fi
elif [ "$b" -gt "$a" ]
then
	if [ "$b" -gt "$c" ]
        then
                echo "$b is the greatest number"
                exit 0
        elif [ "$c" -gt "$b" ]
        then
                echo "$c is the greatest number"
                exit 0
        else
                echo "$b and $c are equal and the greatest numbers"
                exit 0
        fi
else
	if [ "$a" -gt "$c" ]
        then
                echo "$a and $b are equal and  the greatest numbers"
                exit 0
        elif [ "$c" -gt "$a" ]
        then
                echo "$c is the greatest number"
                exit 0
        else
                echo "$a, $b and $c are equal numbers"
                exit 0
        fi
fi
