#!/bin/bash
if [ -f /etc/openvpn/ca.crt ]
	then
	echo "Connecting to IIITH VPN..."
	echo "Press any key to continue."
	read random
	sudo bash ./IIITH-VPN/vpn.sh && sudo bash ./IIITH-VPN/vpn_exit.sh
	echo "You have successfully disconnected."

else
	echo "This will setup openvpn for you. Press any key to continue."
	read random
	sudo apt install openvpn
	wget https://vpn.iiit.ac.in/ca.crt
	wget https://vpn.iiit.ac.in/all.iiit.ac.in.crt
	echo "Please enter your IIITH email address."
	read user
	echo "Please enter the password."
	read pass
	wget --user $user --password $pass https://vpn.iiit.ac.in/secure/all.iiit.ac.in.key
	wget https://vpn.iiit.ac.in/linux_client.conf
	
	if [ -d /etc/openvpn/ ]
		then
		echo "OK"
	else
		mkdir /etc/openvpn/
	fi
	mv ca.crt /etc/openvpn/
	mv all.iiit.ac.in.crt /etc/openvpn/
	mv all.iiit.ac.in.key /etc/openvpn/
	mv linux_client.conf /etc/openvpn/
	echo "You have successfully installed openvpn."
	echo "From now on you can run this same script to connect to IIITH VPN."
fi
