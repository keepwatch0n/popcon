#!/bin/bash

stringfunction() {
  echo "Enter a string:"
  read str
  echo "Length: ${#str}"
  echo "Uppercase: ${str^^}"
  echo "Lowercase: ${str,,}"
}
stringfunction
