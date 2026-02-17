#!/bin/bash
echo "All variables passed: $@"
echo "Number of variables: $#"
echo "script name: $0"
echo "prsent working directory: $PWD"
echo "home directory of current user: $HOME"
echo "Which user is running the script: $USER"
echo "process id of current script: $$"
echo "process id of last command: $!"