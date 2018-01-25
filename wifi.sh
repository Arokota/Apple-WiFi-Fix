#!/bin/bash

count=0

while [ "$count" -ne 4 ]
do 

ping -c 1 -W 5 8.8.8.8 &>/dev/null   
#Ping until returns an error code
	if [ $? -ne 0 ]
	then
		#echo "Count: $count"
		count=$((count + 1))
	fi
	if [ $count -eq 4 ]
	then
		#Do adapter magic
		networksetup -setairportpower en0 off
		#echo "Adapter Off"
		sleep .5
		networksetup -setairportpower en0 on
		#echo "Adapter On"
		sleep 10
		count=0
	fi
done

