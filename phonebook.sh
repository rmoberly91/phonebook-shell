#!/bin/bash

file=phonebook.txt
touch $file

if [[ -z $1 ]]; then
	echo "Invalid input"
	exit 1
fi

if [[ $1 == *"new"* ]]; then
	echo $2 $3 >> phonebook.txt
	echo 'Contact added.'

elif [[ $1 == *"list"* ]]; then
	if [[ -s $file ]]; then
		cat -n $file
	else
		echo "File is empty."
	fi
	
elif [[ $1 == *"remove"* ]]; then
	sed -i '/^'$2'/d' phonebook.txt

elif [[ $1 == *"clear"* ]]; then
	rm -f $file 
	touch $file

elif [[ (-z $2 && $1 != *"list"*) ]]; then
	find=$(grep $1 $file)
	if [[ (-z $find) ]]; then
		echo 'No entry found.'
	else 
		echo $find 
	fi
fi
