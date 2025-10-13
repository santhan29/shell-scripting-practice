#!/bin/bash

#this is the script to demonstrate the installation of packages (ex:git,mysql,nginx) using conditions

userid=$(id -u) 
if [ $userid == 0 ]
then 
    echo "user has superuser privileges"
    dnf install nginx -y 

else
    echo "user has no superuser privileges"
fi 

