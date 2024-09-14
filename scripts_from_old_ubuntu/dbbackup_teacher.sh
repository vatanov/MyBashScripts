#!/bin/bash
date=$(date "+%Y_%m_%d")
destination_folder="/home/devops/backup"
dibname="mydb"
dbuser="root"
dbpass="test123"
backup_path="$destination_folder"/backup-"$dbname"-"$date.sql.lzma"

mkdir -p $destination_folder

systemctl is-active --quiet mysql || exit 1

mysqldump -u $dbuser -p $dbpass $dbname | lzma > $backup_path 

find destination folder -type f -mtime +7 -delete
