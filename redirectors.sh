#!/bin/bash

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S) 
log_file="$logs_folder/$script_name-$time_stamp.log" 
mkdir -p $logs_folder 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m" 

check_root(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R please run the script with root privilege $N" &>> $log_file 
        exit 1
    fi
}

check_root

validate(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2 is ... $R failed $N" &>> $log_file 
        exit 1 
    else 
        echo -e "$2 is ... $G success $N" &>> $log_file 
    fi 
} 


