#!/bin/bash
#SVC="httpd"
#TEMPDIR="/tmp/webfiles"
URL="https://www.tooplate.com/zip-templates/2131_wedding_lite.zip"
ART_NAME="2131_wedding_lite"


yum --help $> /dev/null

if [ $? -eq 0 ]
then
   echo "running script on centos"
   
   #set variables for centos   
   PACKAGE="httpd unzip wget"
   SVC="httpd"
   #install the required packages
   sudo yum install $PACKAGE -y > /dev/null
   #bouncing service
   sudo systemctl start $SVC
   sudo systemctl enable $SVC

   #create directory in tmp
   #using -p option so if the directory exists it will not throw the error
   mkdir -p $TEMPDIR
   cd $TEMPDIR

   #downloading template in zip format from tooplate.com
   wget $URL > /dev/null

   #unzipping the downloading file
   unzip $ART_NAME.zip

   #copy the unzip content to /var/www/html directory
   #This is the artifact deployment
   sudo cp -r $ART_NAME/* /var/www/html/


   #restarting the server
   sudo systemctl restart $SVC

   #cleaning up the temp directory after setup
   rm -rf $TEMPDIR

   #printing the status of service
   sudo systemctl status $SVC

   ls /var/www/html/

else

   echo "running script on ubuntu"

   #set variables for centos
   PACKAGE="apache2 unzip wget"
   SVC="apache2"
   #install the required packages
   sudo apt udpate
   sudo apt install $PACKAGE -y > /dev/null
   #bouncing service
   sudo systemctl start $SVC
   sudo systemctl enable $SVC

   #create directory in tmp
   #using -p option so if the directory exists it will not throw the error
   mkdir -p $TEMPDIR
   cd $TEMPDIR

   #downloading template in zip format from tooplate.com
   wget $URL > /dev/null

   #unzipping the downloading file
   unzip $ART_NAME.zip

   #copy the unzip content to /var/www/html directory
   #This is the artifact deployment
   sudo cp -r $ART_NAME/* /var/www/html/


   #restarting the server
   sudo systemctl restart $SVC

   #cleaning up the temp directory after setup
   rm -rf $TEMPDIR

   #printing the status of service
   sudo systemctl status $SVC

   ls /var/www/html/

fi
