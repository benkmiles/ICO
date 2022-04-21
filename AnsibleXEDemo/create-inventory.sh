#!/bin/bash

isappend=0
while getopts g:s:o:a flag
do
    case "${flag}" in
        g) groupname=${OPTARG};;
        s) servers=${OPTARG};;
        o) myoutfile=${OPTARG};;
        a) isappend=1;;
    esac
done
if [ -z "$myoutfile" ]
then
        myoutfile=custom_inventory
fi

if (($isappend > 0));
then
    echo Appending to File: "$myoutfile"
    echo ["$groupname"] >> "$myoutfile"
else
    echo ["$groupname"] > "$myoutfile"
fi

for i in ${servers//,/ }
do
    echo "$i" >> "$myoutfile"
done