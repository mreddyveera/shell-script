#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR::Please switch to the root user"
    exit 1
fi

dnf list installed mysql

if  [$? -ne 0]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "ERROR:: Installing mysql ....Failed"
        exit1
    else
        echo "INFO:: Mysql....success"

    fi
else
    echo "INFO:: MYSQL already installed
fi


dnf list installed git



if [ $! -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "ERROR:: Installing git ... FAILURE"
        exit 1
    else
        echo "INFO:: MYSQL INSTALAION SUCCESS
    fi

else
    echo "Git Installed...Already"
fi