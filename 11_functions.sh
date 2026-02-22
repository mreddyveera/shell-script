#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR::Please switch to the root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: Installing git ... FAILURE"
        exit 1
    else
        echo "INFO:: MYSQL INSTALAION SUCCESS"
    fi
}

dnf list installed mysql

if  [$? -ne 0]
then
    dnf install mysql -y
    VALIDATE $?
else
    echo "INFO:: MYSQL already installed"
fi


dnf list installed git

if [ $! -ne 0 ]
then
    dnf install git -y
    VALIDATE $?

else
    echo "Git Installed...Already"
fi