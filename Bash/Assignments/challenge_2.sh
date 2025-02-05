#!/bin/bash

# This Bash script organises files in a user-specified directory into four categories: TextFiles, Images, Scripts, and Others. 
# It first checks if the directory exists, then moves files based on their extensions.

# Create folders for categorised files if they don’t already exist.
mkdir -p TextFiles Images Scripts Others

# Prompt user for directory input.
read -rp "What is the path to the directory that you'd like to organise?" dir

# Check if the directory exists.
if [ ! -d "$dir" ]; then
    echo "This directory doesn't exist."
    exit 1
fi


# Loop through all files in the specified directory and move them to the correct destination.
for file in "$dir"/*; do
    if [ -f "$file" ]; then
        case "$file" in
            *.txt) mv "$file" TextFiles/ ;;
            *.jpg) mv "$file" Images/ ;;
            *.png) mv "$file" Images/ ;;
            *.sh) mv "$file" Scripts/ ;;
            *) mv "$file" Others/ ;;
        esac
    fi
done

echo "Files have been organized!"