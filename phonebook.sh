#!/bin/bash

file=phonebook.txt
touch $file

new_user(){
	
	echo $2 $3  >> phonebook.txt
	echo 'Contact added.'
}

list_all(){
	if [[ -s $file ]]; then
		cat -n $file
	else
		echo "File is empty."
	fi
}
delete_entry(){
	sed -i '/^'$1'/d' phonebook.txt
}

clear_file() {
	rm -f $file
	touch $file
}
search_for(){
	find=$(grep $1 $file)
	if [[ (-z $find) ]]; then
		echo 'No entry found.'
	else 
		echo $find 
	fi
}

if [[ -z $1 ]]; then
	echo "Invalid input"
	exit 1
fi

if [[ $1 == *"new"* ]]; then
	new_user $1 $2 $3
elif [[ $1 == *"list"* ]]; then

	list_all
elif [[ $1 == *"remove"* ]]; then
	delete_entry $2
elif [[ $1 == *"clear"* ]]; then
	clear_file
elif [[ (-z $2 && $1 != *"list"*) ]]; then
	search_for $1
fi
