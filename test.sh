#!/bin/bash
#This Is a Comment

if [ $# -ne 1 ]
then
	echo "the usage of this command is $0 name"
	exit 255
fi

echo Hi $1

echo -e "\nToday's date is:\c"
date
