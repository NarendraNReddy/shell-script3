#!/bin/bash

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
echo $SCRIPT_NAME

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please be a super user to install the package"
    exit 1 
else 
    echo "Super User"
fi 


for i in $@;
do 
    dnf list installed $i
    if [ $? -eq 0 ];
    then 
        echo "$i already installed...SKIPPING"
    fi
done 