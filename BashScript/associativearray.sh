#!/bin/bash

declare -A student
student[Name]="Aditya"
student[Roll]=101
student[Course]="CSE"

echo "Student Details:"
for key in "${!student[@]}"
do
  echo "$key: ${student[$key]}"
done
