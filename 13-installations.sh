#!/bin/bash

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
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
        echo -e "$1 is ... $R FAILURE $N"
    else 
        echo -e "$2 installation is ... $G SUCCESS $N"
    fi    

}

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
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ];
    then 
        echo -e "$i already installed...$Y SKIPPING $N"
    else 
        dnf install $i -y &>>$LOGFILE 
        VALIDATE $? "$i instllation "   
    fi
done 