#!/bin/bash

echo "Please wait, your Internet connection is checking..."

if host google.com &> /dev/null && ping -c4 amazon.com &> /dev/null
then
	echo "Your internet connection is UP!"
else
	echo "You have troubles with Internet!"
fi
