#!/bin/bash

ROOT_UID=0
ROOT_NAME="root"

FILES=(
	"/usr/share/applications/ubuntu-amazon-default.desktop"
	"/usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js"
	"/usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json"
)

echo -e "\n\e[34m =============\n Remove Amazon\n =============\e[39m\n"

if [ $UID != $ROOT_UID -o "$(whoami)" != $ROOT_NAME ]; then
	echo -e "\e[91m (!) You don't have sufficient privileges to run this script.\n"
    exit 1
fi

for i in "${FILES[@]}"
do
	if [ -f $i ]; then
	 	sudo rm $i
		echo -e " \e[93m[ DELETED ]\e[39m $i"
	fi
done

echo -e " \e[92m[ Done ]\n"
exit 0
