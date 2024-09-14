#!/bin/bash
if [ $# -ne 2  ]
then
        echo "2 arguments requrired: file fo move, dest file."
        exit 1
fi

if [ ! -f "$1" ]
then
        echo "$1 does not exist or not file."
        exit 1
fi

if cp "$1" "$2" && rm -f "$1"
then
        echo "File $1 is renamed to $2"
        exit 0
else
        echo "Error: Something went wrong!"
fi
