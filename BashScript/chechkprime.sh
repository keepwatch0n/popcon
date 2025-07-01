#!/bin/bash

checkPrime() {
  read -p "Enter number: " num
  if [ $num -le 1 ]; then
    echo "Not a prime"
    return
  fi
  for ((i=2; i<=num/2; i++)); do
    if [ $((num % i)) -eq 0 ]; then
      echo "Not a prime"
      return
    fi
  done
  echo "Prime number"
}
checkPrime
