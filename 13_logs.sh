#!bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shell-scriptlogs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%s)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script execution started at: $TIMESTAMP" &>>$LOG_FILE_NAME

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
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $?
else
    echo -e "$G INFO:: MYSQL already installed"
fi


dnf list installed git &>>$LOG_FILE_NAME

if [ $! -ne 0 ]
then
    dnf install git -y
    VALIDATE $?

else
    echo -e "$Y Git Installed...Already"
fi