#!/bin/bash

user_dir="/home/user"
trash_dir="$user_dir/TRASH"

if [ ! -d $trash_dir ]
then
	mkdir $trash_dir
fi

if [ -d $1 ]
then
	tar cf $1.tar $1/
	rm -r -f $1/
	gzip -f $1.tar
        mv $1.tar.gz $trash_dir
else
	gzip -f $1
	mv $1.gz $trash_dir
fi

find $trash_dir -mtime +2 -delete
