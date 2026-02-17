#!/bin/bash
NAMES=("ALEX" "JAMES" "VRINDA" "NAVYA")
SIZE=${#NAMES[@]}
echo "$SIZE"
echo "First Name is: ${NAMES[0]}"
echo "Second name is: ${NAMES[1]}"
echo "last name is:${NAMES[$SIZE-1]}" 