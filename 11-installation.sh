#!/bin/bash


USERID=$(id -u)
if [ $USERID -ne 0 ];
then 
    echo "Please run this command through super user"
else 
    echo "Super User"
fi 


VALIDATE()
{
    if [ $0 -ne 0 ];
    then 
        echo "$2 is ... FAILURE"
    else 
        echo "$2 is .... SUCCESS"    
}




dnf install mysql -y
VALIDATE $? "mysql installation"



dnf install git -y
VALIDATE $? "mysql installation"

