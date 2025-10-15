#!/bin/bash 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m" 
Y="\e[33m"

check_root(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R please run the script with root privilege $N"
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
        echo -e "$2 is ... $G success $N"
    fi 
} 

echo "script started executing at: $(date)" 

dnf install nginx -y 
validate $? "installing nginx" 

systemctl enable nginx
validate $? "enabling nginx"

systemctl start nginx
validate $? "starting nginx" 

rm -rf /usr/share/nginx/html/*
validate $? "removing the default nginx content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
validate $? "downloading the frontend code"

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

cp /home/ec2-user/shell-scripting-practice/expense-project/expense.conf /etc/systemd/system/backend.service 

systemctl restart nginx
validate $? "restarting the nginx" 

