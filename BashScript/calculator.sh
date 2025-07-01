#!/bin/bash

echo "Enter two numbers:"
read a
read b
echo "Choose operation: + - * /"
read op

case $op in
  +) echo "Result: $((a + b))" ;;
  -) echo "Result: $((a - b))" ;;
  \*) echo "Result: $((a * b))" ;;
  /) echo "Result: $((a / b))" ;;
  *) echo "Invalid operator" ;;
esac
