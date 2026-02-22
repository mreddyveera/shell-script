#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR::Please switch to the root user"
    exit 1
fi

dnf install mysql -y

if [ ($!) -ne 0 ]
then
    echo "ERROR:: Installing mysql ....Failed"
    exit1
else
    echo "Error:: Mysql....success"
fi

dnf install git -y

if [ $! -ne 0 ]
then
    echo "ERROR:: Installing git ... FAILURE"
    exit 1
else
    echo "Installing Git ... SUCCESS"
fi