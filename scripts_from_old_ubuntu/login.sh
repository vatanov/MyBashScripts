#!/bin/bash

read -p "Please enter username: " username
if [ "$username" = "Admin" ]
then
	read -s -p "Please enter password: " password
	if [ "$password" = "qwerty" ]
	then
		echo "Welcome, $username"
	else
		echo "Invalid password!"
		exit 1
	fi
else
	echo "Invalid username!"
fi
