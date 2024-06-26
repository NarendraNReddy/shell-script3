#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
BL="\e[34m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ];
    then 
        echo -e "$2 is ... $R FAILURE $N"
    else 
        echo -e "$2 is ... $G SUCCESS $N"    
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Be a super user to install the commands"
    exit 1
else 
    echo "Super User"     
fi  

dnf install mysql-server -y &>>$LOGFILE 
VALIDATE $? "mysql server installtion: "

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enable mysqld server:  "

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "start mysqld server:  "

mysql_secure_installation --set-root-pass ExpenseApp@12 &>>$LOGFILE
VALIDATE $? "Set DB username and password: "
