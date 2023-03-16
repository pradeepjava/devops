#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
  echo "One active network interface found"

elif [ $value -gt 1 ]
then 
  echo "More than one active network interface found"

else
  echo "No active network interface found"

fi
