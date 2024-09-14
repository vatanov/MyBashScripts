#!/bin/bash

if [ $# -ne 1  ]
then
        echo "1 argument requrired: file fo delete."
        exit 1
fi

user_dir="/home/user"
trash_dir="$user_dir/TRASH"
done_msg="$1 archived and moved into TRASH dir"

if [ ! -d $trash_dir ]
then
	mkdir $trash_dir
fi

if [ -d $1 ]
then
	echo "$1 is a directory"
	tar cf $1.tar $1/
	rm -r -f $1/
	gzip -f $1.tar
        mv $1.tar.gz $trash_dir
	echo $done_msg
else
	file_inum=$(stat -c '%i' $1)
	if [ -L $1 ]
	then
		orig_file_path=`readlink $1`
		rm -f $1
		echo "$1 is symbolic link. It is removed with no backup!"
		echo "Original file: $orig_file_path"
	elif [[ `find . -inum $file_inum 2> /dev/null | wc -l` -gt 1 ]]
	then
		rm -f $1
		files_list=$(find . -inum $file_inum 2> /dev/null)
		echo "$1 is hard link. It is removed with no backup!"
		echo "Other file(s) with Inode: $file_inum:"
		for i in $files_list
		do
			echo $i
		done
	else
		echo "$1 is a file"
		gzip -f $1
		mv $1.gz $trash_dir
		echo $done_msg
	fi
fi

find $trash_dir -mtime +2 -delete
