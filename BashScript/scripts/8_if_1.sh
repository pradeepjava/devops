#!/bin/bash

read -p "Enter a number:" num

if [ $num -gt 100 ]
then
  echo "number is greater then 100"
  echo
  sleep 3
  date

else
  echo "number is less then 100"

fi
