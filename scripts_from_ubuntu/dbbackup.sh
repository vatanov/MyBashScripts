#!/bin/bash

if [ $# -ne 1 ]
then
	echo "1 argument required: database name to create its back up"
	exit 1
fi

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_DIR="/tmp"

echo "Database $1 back up is starting..."
if sudo mysqldump -u root $1 | gzip > $BACKUP_DIR/$1_$TIMESTAMP.sql.gz
then
	echo "Database $1 backup file is created in $BACKUP_DIR/$1_$TIMESTAMP.sql.gz"
else
	echo "Something went wrong!"
	exit 1
fi
