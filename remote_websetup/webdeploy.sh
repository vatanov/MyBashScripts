#!/bin/bash

USR="devops"

for host in $(cat remote_hosts)
do
	echo "########################################"
	echo "######## Copying script to $host #######"
	scp websetup_multi_os.sh $USR@$host:/tmp
	echo "######## Running script on $host #######"
	ssh $USR@$host sudo /tmp/websetup_multi_os.sh
        echo "###### Removing script from $host ######"
	ssh $USR@$host sudo rm -rf /tmp/websetup_multi_os.sh
	echo "########################################"
	echo ""
done
