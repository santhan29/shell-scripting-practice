#!/bin/bash

#this is the shell script to demonstrate the conditions in shell scripting
#if the given number is greater than 20 it will print number is greater than 20 otherwise it
#it will print number is less than 20 

#author -- santhan 

num=$1
if [ $num -gt 20 ]; then
    echo "number is greater than 20"
else 
    echo "number is less than 20" 
fi 