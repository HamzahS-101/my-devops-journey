#!/bin/bash

# Ask the user to enter the directories required to perform the backup
read -p "What is the name of the directory that you want to backup?" dir
read -p "What is the name of the directory that you want the data to be transferred to?" backup_dir


if [ ! -d "$dir" ]; then
    echo "The directory you entered doesn't exist."
    exit 1
fi

if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    cp $dir/*txt $backup_dir/
    echo "All .txt files from '$dir' have been successfully copied over to '$backup_dir'."
else
    cp $dir/*txt $backup_dir/
    echo "All .txt files from '$dir' have been successfully copied over to '$backup_dir'."
fi


