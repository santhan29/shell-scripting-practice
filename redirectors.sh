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
Y="\e[33m"

check_root(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R please run the script with root privilege $N" &>> $log_file 
        exit 1
    fi
}

check_root

usage (){
    echo -e " $R usage is sudo sh 16-redirectors.sh package1 package2.. $N"
    exit 1
}



validate(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2 is ... $R failed $N" &>> $log_file 
        exit 1 
    else 
        echo -e "$2 is ... $G success $N" &>> $log_file 
    fi 
} 

if [ $# -eq 0 ]
then 
    usage
fi 


for package in $@
do 
    dnf list installed $package &>> $log_file 
    if [ $? -ne 0 ]
    then 
        echo -e "$R $package is not installed, going to install $N" &>> $log_file 
        dnf install $package -y &>> $log_file 
        validate $? "installing $package"
    else 
        echo -e "$Y $package is already installed.. nothing to do $N" &>> $log_file 
    fi 
done
