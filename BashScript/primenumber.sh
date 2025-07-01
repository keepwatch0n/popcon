#!/bin/bash

echo "Enter a number:"
read num
flag=0

for ((i=2; i<num; i++))
do
  if [ $((num % i)) -eq 0 ]; then
    flag=1
    break
  fi
done

if [ $flag -eq 0 ]; then
  echo "$num is a Prime Number"
else
  echo "$num is NOT a Prime Number"
fi
