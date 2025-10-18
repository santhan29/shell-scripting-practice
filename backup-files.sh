#!/bin/bash

#this script demonstrates on how to backup the files 
# dynamically user gives the source directory, destination directory, and no.of days 
source_dir=$1
destination_dir=$2 
days=${3:-14} #if $3 is empty, default is 14 days
time_stamp=$(date +%Y-%m-%d-%H-%M-%S) 

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

echo "files: $files" 

if [ ! -z $files ]  #true if files is empty, ! makes the expression false 
then
    echo "files are found"
    zip_file="$destination_dir/app-logs-$time_stamp.zip" 
    find $source_dir -name "*.log" -mtime +14 | zip "$zip_file" -@ 

    #check if zip file is successfully created or not 
    if [ -f $zip_file ]
    then 
        echo "successfully zipped files older than $days"
        #remove the files after zipping 
        while IFS=  read -r line #IFS is internal field separator, here we are keeping ifs as empty, -r is for not to ignore special character like /
        do 
            echo "Deleting line: $file"
            rm -rf $file 
        done <<< $files 
    else 
        echo "zipping the files is failed"
        exit 1 
    fi 
else 
    echo "no files older than $days"
fi 