#!/bin/bash

echo "first way of iterating items ###############"
for var in 1 2 3 4 5
do
echo "$var"
done

echo "second way of iterating items ###############"
for var in pradeep mohan sures
do
echo "$var"
done

echo "third way of iterating items ###############"
#item will read from the file and will iterate in the loop. If the content of item is like above string then it will be treated as listitem
for var in $(cat /opt/scripts/itemlist.txt)
do
echo "$var"
done

