#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shell_script.logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ....$R Failure $N"
        exit 1
    else 
        echo -e "$2 ....$G SUCCESS $N"
    fi
}

USAGE(){

    echo -e "$R USAGE:: $N sh 15_backuplogs.sh <SOURCE_DIR> <DIST_DIR> <DAYS(Optional)>"
    exit 1

}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Does not exists ... Please check"
    exit 1
else if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR Does not exists ... Please check"
    exit 1
fi



echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
FILES=$(find $SOURCE_DIR -name ".log" +mtime +$DAYS)

echo "Files are : $FILES"

if [ -n $FILES ]
then
    echo "Files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name ".log" -mtime +$DAYS | zip -@ " $ZIP_FILE "
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully created zip file for files older than $DAYS"
        while read -r filepath
        do
            echo "Deleting file: $filepath" &>>$LOG_FILE_NAME
            rm -rf $filepath
            echo "Deleted file: $filepath"
        done <<< $FILES
    else
        echo -e "$R ERROR :: $N Failed to create ZIP file "
else
    echo "No files are found older than $DAYS "
fi