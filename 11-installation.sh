#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
echo $LOGFILE
R="\e[31"


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
    if [ $1 -ne 0 ];
    then 
        echo -e "$2 is ... $R FAILURE"
    else 
        echo "$2 is .... SUCCESS"    
    fi    
}




dnf install mysql -y &>>$LOGFILE
VALIDATE $? "mysql installation"



dnf install git -y &>>$LOGFILE
VALIDATE $? "git installation"

