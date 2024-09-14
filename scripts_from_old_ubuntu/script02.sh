#!/bin/bash
while true
do
        echo "Who do you want advice from?"
        cat << options
bunny
tux
daemon
kitty
vader-koala
quit
options
        echo
        read -p "Make your choice: " option
        if [ $option = "quit" ]
        then
                break
        else
                echo
                fortune | cowsay -f $option
        fi
done
