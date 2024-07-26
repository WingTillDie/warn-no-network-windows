#!/bin/env bash
while true; do
	ping 8.8.8.8 -c 1 -W 1
	result=$?
	if [ $result -eq 1 ]; then
		echo "No network"
		powershell.exe -Command 'Import-Module BurntToast; New-BurntToastNotification -Text "No network"'
		xmessage No network
	elif [ $result -eq 0 ]; then
		echo "Has network"
		sleep 1m
	else
		echo -n "Unknown return code"
		echo " $result"
		xmessage Unknown return code $?
	fi
done
