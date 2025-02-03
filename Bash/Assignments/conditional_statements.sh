#!/bin/bash

read -p "Enter the filename: " file

if [ ! -f "$file" ]; then
    echo "The file '$file' does not exist."
    exit 0
elif [ -r "$file" ]; then
    echo "The file '$file' exists and is readable."
    exit 0
elif [ -w "$file" ]; then
    echo "The file '$file' exists and is writable."
    exit 0
elif [ -x "$file" ]; then
    echo "The file '$file' exists and is executable."
    exit 0
fi
