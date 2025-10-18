#!/bin/bash

#this script demonstrates deleting the log files older than 14 days
#algorithm
# ---------------
#first find the directory in which logs are stored and check whether that directory exists or not
#find the log files in that directory  
#then delete it  

sour_dir=/home/ec2-user/logs 
cd $sour_dir 
if [ $? -ne 0 ]
then 
    echo "directory not exists"
    exit 1 
else
    echo "directory exists" 
fi 

files=$(find $sour_dir -name "*.log" -mtime +14) 
echo "FILES: $files" 

while IFS=  read -r line #IFS is internal field separator, here we are keeping ifs as empty, -r is for not to ignore special character like /
do 
    echo "Deleting line: $line"
done <<< $files 

