#!/bin/bash

function popup_msg()
{
	kdialog --passivepopup "$1" $2
}

choice=$(kdialog --menu "Select a command:" \
	1 "Toggle minikube" \
	2 "Get minikube status" \
	3 "Open protonvpn"
)

case $choice in
	2)
		output=$(minikube status)
		kdialog --msgbox "$output"
		;;
	1) 
		output=$(minikube status)
		if echo "$output" | grep -qw "host: Stopped"; then
			popup_msg "Starting minikube" 5
			minikube start
			popup_msg "minikube started" 5
		else
			popup_msg "Stopping minikube" 5
			#kdialog --passivepopup "Stopping minikube" 5
			minikube stop
			popup_msg "minikube stopped" 5
			#kdialog --passivepopup "minikube stopped" 5
		fi
		;;
	3)
		popup_msg "Opening vpn app" 5
		protonvpn-app
		;;
esac
