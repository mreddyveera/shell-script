#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "Given number is gretaer than 100"
elif [ $NUMBER -eq 100 ]
then
    echo "Given number is equals to 100"
else
    echo "Given number is less than 100"
fi