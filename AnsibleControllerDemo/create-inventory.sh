#!/bin/bash

while getopts d:w:o: flag
do
    case "${flag}" in
        d) dbservers=${OPTARG};;
        w) webservers=${OPTARG};;
        o) myoutfile=${OPTARG};;
    esac
done
if [ -z "$myoutfile" ] 
then
	myoutfile=custom_inventory
fi

echo [dbservers] > "$myoutfile"
for i in ${dbservers//,/ }
do
    echo "$i" >> "$myoutfile"
done
echo [webservers] >> "$myoutfile"
for i in ${webservers//,/ }
do
    echo "$i" >> "$myoutfile"
done

