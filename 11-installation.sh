#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log




R="\e[31m"
G="\e[32m"
Y="\e[33m"
BL="\e[34m"
N="\e[0m"

echo "Program started at: $TIMESTAMP"


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
        echo -e "$2 is ... $R FAILURE $N"
    else 
        echo -e "$2 is .... $G SUCCESS $N"    
    fi    
}




dnf install mysql -y &>>$LOGFILE
VALIDATE $? "mysql installation"



dnf install git -y &>>$LOGFILE
VALIDATE $? "git installation"

