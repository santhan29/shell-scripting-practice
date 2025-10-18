#!/bin/bash

#this script demonstrates on how to backup the files 
# dynamically user gives the source directory, destination directory, and no.of days 
source_dir=$1
destination_dir=$2 
days=${3:-14} #if $3 is empty, default is 14 days

usage(){
    echo "usage:: sh backup-files.sh <source> <destination> <days(optional)>" 
}

if [ $# -lt 2 ]
then 
    usage
fi 

if [ ! -d $source_dir ]
then 
    echo "$source_dir doesnot exists...please check" 
fi 

if [ ! -d $destination_dir ]
then 
    echo "$destination_dir doesnot exists...please check" 
fi 

files=$(find $source_dir -name "*.log" -mtime +14) 

if [ -n $files ]
then
    echo "files are found"
else 
    echo "no files older than $days"
fi 