#!/bin/bash

disk_usage=$(df -hT | grep xfs) 
disk_threshold=5 #in companies it will be 75 

while IFS=  read -r line #IFS is internal field separator, here we are keeping ifs as empty, -r is for not to ignore special character like /
do 
    echo "$line"  
done <<< $disk_usage 