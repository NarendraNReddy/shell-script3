#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please be a super user to install the package"
    exit 1 
else 
    echo "Super User"
fi 
        