#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m" 

check_root(){
    if [ $userid -ne 0 ]
    then
        echo "please run the script with root privilege"
        exit 1
    fi
}

check_root

validate(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2 is ... $R failed $N"
        exit 1 
    else 
        echo -e "$2 is ... $R success $N"
    fi 
} 

# sh loop-2.sh git mysql nginx

for package in $@
do 
    dnf list installed $package 
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install"
        dnf install $package -y 
        validate $? "installing $package"
    else 
        echo "$package is already installed.. nothing to do"
    fi 
done