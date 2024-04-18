#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
echo $TIMESTAMP

USERID=$(id -u)
if [ $USERID -ne 0 ];
then 
    echo "Please run this command through super user"
    exit 1
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
    fi    
}




dnf install mysql -y
VALIDATE $? "mysql installation"



dnf install git -y
VALIDATE $? "mysql installation"
