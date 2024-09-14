#!/bin/bash

if [ ! -f "$1" ]
then
	echo "Error! $1 does not exist or directory"
	exit 1
fi

unknown_error_msg="Error! Something went wrong!"
start_unpacking_msg="Unpacking file $1 ..."
unpacked_ok_msg="File $1 successfully unpacked!"

file_extention=`echo ${1##*.}`

unpackGz()
{
	echo $start_unpacking_msg
	if gunzip $1 &> /dev/null
	then
		echo $unpacked_ok_msg
		exit 0
	else
		echo $unknown_error_msg
		exit 1
	fi
}

unpackBz2()
{
	echo $start_unpacking_msg
        if bunzip2 $1 &> /dev/null
	then
                echo $unpacked_ok_msg
                exit 0
        else
                echo $unknown_error_msg
                exit 1
        fi	
}

unpackLzma()
{
	echo $start_unpacking_msg
        if unlzma $1 &> /dev/null
	then
                echo $unpacked_ok_msg
                exit 0
        else
                echo $unknown_error_msg
                exit 1
        fi
}

unpackZip()
{
        if ! command -v unzip &> /dev/null
        then
                echo "Error! Unzip is not found"
                exit 1
        else
		echo $start_unpacking_msg
                if unzip $1 &> /dev/null
		then
                        echo $unpacked_ok_msg
                        exit 0
                else
                        echo $unknown_error_msg
                        exit 1
                fi
        fi
}

case $file_extention in
	"gz") unpackGz $1;;
	"bz2") unpackBz2 $1;;
	"lzma") unpackLzma $1;;
	"zip") unpackZip $1;;
	*)
		echo "Error! Unknown file format. Probably not an archive"
		exit 1;;
esac
