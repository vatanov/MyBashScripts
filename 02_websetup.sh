#!/bin/bash

# Installing dependiences
echo "##############################"
echo "Installing packages"
echo "##############################"
sudo yum install wget unzip httpd -y

# Start and enable service
echo "##############################"
echo "Start and enable httpd service"
echo "##############################"
sudo systemctl start httpd
sudo systemctl enable httpd

# Artefact deployment
echo "##############################"
echo "Artefact deployment"
echo "##############################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
unzip -o 2135_mini_finance.zip
sudo cp -r 2135_mini_finance/* /var/www/html/

# Restart service
echo "##############################"
echo "Restart httpd service"
echo "##############################"
sudo systemctl restart httpd

# Cleanup
echo "##############################"
echo "Removing temporary files"
echo "##############################"
rm -rf /tmp/webfiles
