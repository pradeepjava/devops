#!/bin/bash

#install the required packages
sudo yum install httpd unzip wget -y > /dev/null

#starting and enabling the server
sudo systemctl start httpd
sudo systemctl enable httpd

#create directory in tmp
#using -p option so if the directory exists it will not throw the error
mkdir -p /tmp/webfiles
cd /tmp/webfiles

#downloading template in zip format from tooplate.com
wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip > /dev/null

#unzipping the downloading file
unzip 2131_wedding_lite.zip

#copy the unzip content to /var/www/html directory
#This is the artifact deployment
sudo cp -r 2131_wedding_lite/* /var/www/html/


#restarting the server
sudo systemctl restart httpd

#cleaning up the temp directory after setup
rm -rf /tmp/webfiles

#printing the status of service
sudo systemctl status httpd

#printing the content of html directory
sudo ls - l /var/www/html/
