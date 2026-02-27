#!/bin/bash
#!bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
SOURCE_DIR="/home/ec2-user/app-logs"
LOGS_FOLDER="/var/log/shell-scriptlogs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%s)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
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

echo "Script started at : $TIMESTAMP" &>>$LOG_FILE_NAME
FILES_TO_DELETE=(find . -name "*.log" -mtime +14)
echo "Files to be delted $FILES_TO_DELETE"

while read -r file
do
    echo "Deleteing file $file"
    rm -rf $file
done <<< $FILES_TO_DELETE