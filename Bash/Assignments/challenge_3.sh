#!/bin/bash

# This script checks the total disk size of a user-specified directory and alerts the user if the size exceeds a predefined threshold.

# Function to check the size of a directory
check_directory_size() {
    local dir=$1
    local threshold=1000  # Set threshold in MB 

    # Check if the directory exists
    if [ ! -d "$dir" ]; then
        echo "The directory $dir does not exist."
        exit 1
    fi

    # Get the size of the directory in MB
    dir_size=$(du -sm "$dir" | cut -f1)

    # Check if the directory size exceeds the threshold
    if [ "$dir_size" -ge "$threshold" ]; then
        echo "ALERT: The directory $dir is $dir_size MB, which exceeds the $threshold MB threshold!"
    else
        echo "The directory $dir is $dir_size MB, which is within the threshold."
    fi
}

# Ask the user for a directory path
read -rp "Enter the directory path to check its size: " dir

# Run the function to check the directory size
check_directory_size "$dir"
