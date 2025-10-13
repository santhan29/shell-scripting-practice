#!/bin/bash 

#this shell script is for changing the time zone of linux server to IST
DATE=$(date)
echo "date is $DATE"
TIMEZONE=$(timedatectl)
echo "present timezone is $TIMEZONE"
sudo timedatectl set-timezone Asia/Kolkata

