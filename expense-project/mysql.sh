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

echo "script started executing at: $(date)" | tee -a $log_file


validate(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2 is ... $R failed $N" | tee -a $log_file
        exit 1 
    else 
        echo -e "$2 is ... $G success $N" | tee -a $log_file
    fi 
} 

#installing mysql
dnf install mysql-server -y &>>$log_file
validate $? "installing mysql server" 

#enabling mysql 
systemctl enable mysqld &>>$log_file
validate $? "enabling mysql server"

#starting mysql
systemctl start mysqld &>>$log_file
validate $? "starting mysql server"

#setting up the root password 
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
validate $? "settingup root password" 


