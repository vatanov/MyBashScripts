#!/bin/bash

# Declare variables
PACKAGE="wget unzip httpd"
SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
#APT_NAME="2135_mini_finance"
TEMPDIR="/tmp/webfiles"


if [ $# -eq 2 ]
then
    # Installing dependiences
    echo "##############################"
    echo "Installing packages"
    echo "##############################"
    sudo yum install $PACKAGE -y
    
    # Start and enable service
    echo "##############################"
    echo "Start and enable httpd service"
    echo "##############################"
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
    
    # Artefact deployment
    echo "##############################"
    echo "Artefact deployment"
    echo "##############################"
    mkdir -p $TEMPDIR
    cd $TEMPDIR
    wget $1
    unzip -o $2.zip
    sudo cp -r $2/* /var/www/html/
    
    # Restart service
    echo "##############################"
    echo "Restart httpd service"
    echo "##############################"
    sudo systemctl restart $SVC
    
    # Cleanup
    echo "##############################"
    echo "Removing temporary files"
    echo "##############################"
    rm -rf $TEMPDIR
else
    echo "2 arguments required: URL and Name"
fi
