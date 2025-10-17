#!/bin/bash

#this shell script demonstrates that whenever error occurs in a shell script the shell script will automatically exits and dont go for the execution of next commands for this purpose we are using the set -e command inside the linux 

# -e for exit
# -x for debug mode 

set -ex # setting the automatic exit if we get error 
echo "my name is santhan"
echoo "what is your name"
echo "hi, my name is siva" 