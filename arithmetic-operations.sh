#!/bin/bash

#this script is to demonstrate the arithmetic operations of two numbers 
#here we are passing the variables through arguments 

num1=$1
num2=$2 

sum=$(($num1+$num2))
echo "total sum is $sum"

subtraction=$(($num1-$num2)) 
echo "total difference is $subtraction"


multiplication=$(($num1*$num2)) 
echo "total is $multiplication"

division=$(($num1/$num2)) 
echo "total is $division" 
