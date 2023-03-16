#!/bin/bash

USR="devops"

for host in `cat remotehosts`
do
  echo "######################################"
  echo "copying scriptfile to remotehosts"
  scp remoteHostwebsetup.sh $USR@$host:/tmp/
  echo "connecting to host and executing script"
  ssh $USR@$host sudo /tmp/remoteHostwebsetup.sh
  ssh $USR@$host sudo rm -rf /tmp/remoteHostwebsetup.sh

done
  
