#!/bin/bash

#this is the script to demonstrate the installation of packages (ex:git,mysql,nginx) using conditions

userid=$(id -u) 
if [ $userid == 0 ]
then 
    dnf install nginx -y
else
    echo "skip installation"
fi 