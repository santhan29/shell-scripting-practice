#!/bin/bash

logs_folder="/var/log/expense" 
script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S) 
log_file="$logs_folder/$script_name-$time_stamp.log" 
mkdir -p $logs_folder 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m" 
Y="\e[33m"

check_root(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R please run the script with root privilege $N" | tee -a $log_file
        exit 1
    fi
}

check_root

validate(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2 is ... $R failed $N" | tee -a $log_file
        exit 1 
    else 
        echo -e "$2 is ... $G success $N" | tee -a $log_file
    fi 
} 

echo "script started executing at: $(date)" | tee -a $log_file

dnf module disable nodejs -y
validate $? "disabling current version of nodejs"

dnf module enable nodejs:20 -y
validate $? "enabling nodejs:20 version"

dnf install nodejs -y
validate $? "installing nodejs"

id expense
if [ $? -ne 0 ]
then 
    echo -e "$R expense user is not created..create it $N"
    useradd expense
    validate $? "creating the expense user"
else
    echo -e "$Y expense user is already created... skipping $N"
fi 

mkdir /app
validate $? "creating the directory /app" 




