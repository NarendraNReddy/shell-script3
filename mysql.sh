#!/bin/bash
#TIMESTAMP=$(date +%F-%H-%M-%S)
echo $TIMESTAMP

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Be a super user to install the commands"
    exit 1
else 
    echo "Super User"     
fi     
