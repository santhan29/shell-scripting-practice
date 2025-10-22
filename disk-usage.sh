#!/bin/bash

disk_usage=$(df -hT | grep xfs) 
disk_threshold=5 #in companies it will be 75 

while IFS=  read -r line #IFS is internal field separator, here we are keeping ifs as empty, -r is for not to ignore special character like /
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1) 
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}') 
    if [ $USAGE -ge $disk_threshold ] 
    then 
        echo "$PARTITION is more than $disk_threshold, current value is: $USAGE. PLEASE CHECK" 
    fi
done <<< $disk_usage 