#!bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
if [ $USER -ne 0 ]
then
    echo -e "$R ERROR::Please switch to the root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: Installing git ... FAILURE"
        exit 1
    else
        echo -e "$G INFO:: MYSQL INSTALAION SUCCESS"
    fi
}

dnf list installed mysql

if  [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $?
else
    echo -e "$G INFO:: MYSQL already installed"
fi


dnf list installed git

if [ $! -ne 0 ]
then
    dnf install git -y
    VALIDATE $?

else
    echo -e "$G Git Installed...Already"
fi