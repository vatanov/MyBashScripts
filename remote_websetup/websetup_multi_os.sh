#!/bin/bash

# Declare variables
#PACKAGE="wget unzip httpd"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
APT_NAME="2135_mini_finance"
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	echo "this is Fedora"
        
	# Set vars for Fedora
	PACKAGE="wget unzip httpd"
        SVC="httpd"
                
        # Installing dependiences
        echo "##############################"
        echo "Installing packages"
        echo "##############################"
        sudo yum install $PACKAGE -y > /dev/null
        
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
        wget $URL
        unzip -o $APT_NAME.zip
        sudo cp -r $APT_NAME/* /var/www/html/
        
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
	echo "this is Ubuntu"
        
	# Set vars for Ubuntu
	PACKAGE="wget unzip apache2"
        SVC="apache2"
                
        # Installing dependiences
        echo "##############################"
        echo "Installing packages"
        echo "##############################"
        sudo apt update
	sudo apt install $PACKAGE -y > /dev/null
        
        # Start and enable service
        echo "##############################"
        echo "Start and enable apache2 service"
        echo "##############################"
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        
        # Artefact deployment
        echo "##############################"
        echo "Artefact deployment"
        echo "##############################"
        mkdir -p $TEMPDIR
        cd $TEMPDIR
        wget $URL
        unzip -o $APT_NAME.zip
        sudo cp -r $APT_NAME/* /var/www/html/
        
        # Restart service
        echo "##############################"
        echo "Restart apache2 service"
        echo "##############################"
        sudo systemctl restart $SVC
        
        # Cleanup
        echo "##############################"
        echo "Removing temporary files"
        echo "##############################"
        rm -rf $TEMPDIR
fi
