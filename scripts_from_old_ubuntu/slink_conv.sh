#!/bin/bash

if [ $# -ne 1  ]
then
        echo "1 argument requrired: symbolic link to be converted."
        exit 1
fi

if [ -L $1 ]
then
	orig_file=$(readlink $1)
	rm -f $1
	touch $1
	cat $orig_file > $1
else
	echo "Error! $1 is not a symbolic link."
        exit 1
fi
