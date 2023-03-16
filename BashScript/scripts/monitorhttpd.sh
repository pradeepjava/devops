#!/bin/bash

ls /var/run/httpd/httpd.pid

if [ $? -gt 0 ]
then

  echo "httpd service is not running.. starting it"
  sudo systemctl start httpd
  if [ $? -gt 0 ]
  then
   echo "Unable to start service httpd. contact admin"
  else
   echo "started successfully"
  fi

else
  echo "httpd service is already running"

fi

