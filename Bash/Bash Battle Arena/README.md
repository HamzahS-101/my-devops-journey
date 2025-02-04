# Bash Battle Arena 🎮

## Table of Contents
- [Overview](#overview)
- [Level 1](#level-1-the-basics)
- [Level 2](#level-2-variables-and-loops)
- [Level 3](#level-3-conditional-statements)
- [Level 4](#level-4-file-manipulation)
- [Level 5](#level-5-the-boss-battle---combining-basics)
- [level 6](#level-6-argument-parsing)
- [Level 7](#level-7-file-sorting-script)
- [Level 8](#level-8-multi-file-searcher)
- [Level 9](#level-9-script-to-monitor-directory-changes)
- [Level 10](#level-10-boss-battle-2---intermediate-scripting)
- [Level 11](#level-11-automated-disk-space-report)
- [Level 12](#level-12-simple-configuration-file-parser)
- [Level 13](#level-13-backup-script-with-rotation)
- [Level 14](#level-14-user-friendly-menu-script)
- [Level 15](#level-15-boss-battle-3---advanced-scripting)

## Overview

The "Bash Battle Arena" is a fun and interactive command-line game designed to teach and improve Bash scripting skills. Each level in the game presents a unique challenge that requires players to write Bash scripts to solve problems ranging from simple file manipulations to more complex system operations. As players progress through the levels, they gradually learn new Bash concepts and best practices.

The game follows a level-based structure where the difficulty increases with each level. Every 5 levels, players face a Boss Battle that combines the knowledge they have gained up to that point, reinforcing their understanding of Bash scripting.

**Objective:**  
The goal is to "defeat" each level by successfully completing the tasks using Bash scripts. The ultimate aim is to become a "Bash Master."

As part of my Bash learning, I have documented the solutions for all 15 levels in this file, detailing the steps I followed and sharing insights into the challenges I faced and how I overcame them.

## Level 1: The Basics

### Mission:  
Create a directory named `Arena` and then inside it, create three files: `warrior.txt`, `mage.txt`, and `archer.txt`. List the contents of the `Arena` directory.

### Solution:  
```bash
#!/bin/bash

mkdir Arena
cd Arena
touch warrior.txt mage.txt archer.txt
ls
```

### Explanation:

This script begins by creating a new directory called "Arena" using the `mkdir` command. 
It then changes into the "Arena" directory with `cd`. 
Next, the `touch` command is used to create three empty text files: `warrior.txt`, `mage.txt`, and `archer.txt`. 
Finally, the `ls` command lists the contents of the "Arena" directory to confirm that the files were successfully created.

## Level 2: Variables and Loops

### Mission:  
Create a script that outputs the numbers 1 to 10, one number per line.

### Solution:  
```bash
#!/bin/bash

num=1

while ((num <= 10)); do
    echo "$num"
    ((num++))
done
```

### Explanation:

This script starts by defining a variable `num` with an initial value of 1.  
The `while` loop checks if `num` is less than or equal to 10, and as long as the condition is true, it executes the block inside.  
Within the loop, the script prints the current value of `num` using the `echo` command.  
Then, the variable `num` is incremented by 1 with `((num++))`, and the loop continues until `num` reaches 10.

## Level 3: Conditional Statements

### Mission:  
Write a script that checks if a file named `hero.txt` exists in the `Arena` directory. If it does, print `Hero found!`; otherwise, print `Hero missing!`.

### Solution:  
```bash
#!/bin/bash

if [ -f Arena/hero.txt ]; then
    echo "Hero found!"
else
    echo "Hero missing!"
fi
```

### Explanation:

This script uses an `if` statement to check if the file `hero.txt` exists in the `Arena` directory.
The `-f` flag checks if the file is a regular file.
If the file exists, the script will output "Hero found!" using `echo`.
If the file does not exist, the script will output "Hero missing!" instead, using the `else` block.

## Level 4: File Manipulation

### Mission:  
Create a script that copies all .txt files from the Arena directory to a new directory called Backup.

### Solution:  
```bash
#!/bin/bash

mkdir Backup
cp Arena/*.txt Backup/
```

### Explanation:

The script begins by creating a new directory called `Backup` using the `mkdir` command.
Next, the `cp` command is used to copy all `.txt` files from the `Arena` directory to the `Backup` directory. 
The wildcard `*.txt` selects all files with a `.txt` extension in the `Arena` directory.

## Level 5: The Boss Battle - Combining Basics

### Mission:  
Combine what you've learned! Write a script that:
1. Creates a directory named `Battlefield`.
2. Inside Battlefield, create files named `knight.txt`, `sorcerer.txt`, and `rogue.txt`.
3. Check if knight.txt exists; if it does, move it to a new directory called `Archive`.
4. List the contents of both `Battlefield` and `Archive`.

### Solution:  
```bash
#!/bin/bash

mkdir Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

if [ -f Battlefield/knight.txt ]; then
    mkdir Archive
    mv Battlefield/knight.txt Archive/
else    
    echo "The file knight.txt cannot be found"
fi

ls Battlefield
ls Archive
```

### Explanation:

This script begins by creating a directory called `Battlefield` using the `mkdir` command.  
It then creates three files inside the `Battlefield` directory: `knight.txt`, `sorcerer.txt`, and `rogue.txt`, using the `touch` command.  
Next, the script checks if the `knight.txt` file exists using an `if` statement and the `-f` option. If the file exists, it creates a new directory called `Archive` and moves `knight.txt` into it using the `mv` command.  
If `knight.txt` cannot be found, a message is printed.  
Finally, the script lists the contents of both the `Battlefield` and `Archive` directories using the `ls` command to show the files inside each directory.


## Level 6: Argument Parsing

### Mission:  
Write a script that accepts a filename as an argument and prints the number of lines in that file. If no filename is provided, display a message saying 'No file provided'.

### Solution:  
```bash
#!/bin/bash

if [ $# == 0 ]; then 
    echo "No file provided."
elif [ ! -f $1 ]; then 
    echo "$1 doesn't exist."
else 
    line_count=$(wc -l < $1) 
    echo "There are $line_count lines in the file called $1!"
fi
```

### Explanation:

This script begins by checking if any arguments are passed to the script using `$#`.  
If no arguments are provided (`$# == 0`), the script displays a message saying "No file provided".  
If a file is provided but it does not exist (`! -f $1`), the script will display a message saying that the file does not exist.  
If the file exists, the script calculates the number of lines in the file using the `wc -l` command, which counts the lines in the file. The `line_count` variable stores the result of this command, and the script then outputs the number of lines in the provided file.

## Level 7: File Sorting Script

### Mission:  
Write a script that sorts all `.txt` files in a directory by their size, from smallest to largest, and displays the sorted list.

### Solution:  
```bash
#!/bin/bash

echo "What is the name of the directory?"
read directory_name

if [ ! -d "$directory_name" ]; then 
    echo "Sorry. The directory you provided doesn't exist."
else
    sizes=$(ls -l "$directory_name" | sort -k 5 -h | awk '{print $9, $5}')
    echo "Here are the sizes of all the files within the '$directory_name' directory, sorted from smallest to largest: $sizes"
fi
```

### Explanation:

The script begins by prompting the user for the name of a directory and stores the input in the variable `directory_name`.  
It then checks if the directory exists using `[ ! -d "$directory_name" ]`. If the directory does not exist, it prints an error message.  

If the directory exists, the script retrieves a sorted list of file sizes:
- `ls -l "$directory_name"` lists all files with detailed information.
- `sort -k 5 -h` sorts files based on their size (5th column).
- `awk '{print $9, $5}'` extracts and prints the filename (9th column) and its size (5th column).

Finally, the sorted list is displayed to the user.

## Level 8: Multi-File Searcher

### Mission:  
Create a script that searches for a specific word or phrase across all `.log` files in a directory and outputs the names of the files that contain the word or phrase.

### Solution:  
```bash
#!/bin/bash

echo "What is the name of the directory?"
read directory_name
echo "What is the keyword you're looking for?"
read key_word

if [ ! -d "$directory_name" ]; then 
    echo "Sorry. The directory you provided doesn't exist."
else
    search=$(grep -l "$key_word" "$directory_name"/*.log)
    echo "Here are the filenames within the $directory_name directory that contain the keyword '$key_word':$search"
fi  
```

### Explanation:

The script begins by prompting the user to enter a directory name, storing it in the variable `directory_name`.  
Next, it asks for a keyword to search for and stores it in the variable `key_word`.  

The script then checks if the provided directory exists using `[ ! -d "$directory_name" ]`.  
- If the directory does not exist, it prints an error message.  
- If the directory exists, the script uses `grep -l` to search for the keyword within all `.log` files in the specified directory.  
  - `grep -l "$key_word" "$directory_name"/*.log` searches for files containing the keyword and returns only the filenames.  

Finally, the script prints the list of filenames that contain the keyword.

## Level 9: Script to Monitor Directory Changes

### Mission:  
Write a script that monitors a directory for any changes (file creation, modification, or deletion) and logs the changes with a timestamp.

### Solution:  
```bash
#!/bin/bash

dir="Level9_Directory"
logs="logs.txt"

if [ ! -d "$dir" ]; then
    echo "The "$dir" directory does not exist."
    exit 1
fi

fswatch -r "$dir" | while read event; do
    if [ -e "$event" ]; then
        echo "$(date) File modified: $event" >> "$logs"
    else
        echo "No log events detected."
    fi
done
```

### Explanation:

- The script defines `dir` as `"Level9_Directory"` and `logs` as `"logs.txt"`, where directory changes will be recorded.  
- It first checks if the directory exists using `[ ! -d "$dir" ]`.  
  - If the directory does not exist, it prints an error message and exits.  
- The script then uses `fswatch -r "$dir"` to continuously monitor the directory for any file events.  
- The `while read event` loop processes each detected change.  
  - If the changed file still exists (`[ -e "$event" ]`), it logs the event with a timestamp in `logs.txt`.  
  - If the file no longer exists, it prints `"No log events detected."` instead.  

## Level 10: Boss Battle 2 - Intermediate Scripting

### Mission:  
Write a script that:  

1. Creates a directory called `Arena_Boss`.  
2. Creates 5 text files inside the directory, named `file1.txt` to `file5.txt`.  
3. Generates a random number of lines (between 10 and 20) in each file.  
4. Sorts these files by their size and displays the list.  
5. Checks if any of the files contain the word `"Victory"`, and if found, moves the file to a directory called `Victory_Archive`.  

### Solution:  
```bash
#!/bin/bash

mkdir Arena_Boss

for i in {1..5}; do 
    touch "Arena_Boss/file$i.txt"

    num_lines=$((RANDOM % 11 + 10))

    for j in $(seq 1 $num_lines); do
        echo "Random line $j in file$i" >> "Arena_Boss/file$i.txt"
    done
done

echo "Here's the list of all files within the Arena_Boss directory, sorted by size from smallest to largest:"
ls -l "Arena_Boss" | sort -k 5 -h | awk '{print $9, $5}' 

mkdir Victory_Archive

for file in Arena_Boss/*.txt; do
    if grep -q "Victory" "$file"; then
        mv "$file" Victory_Archive/
        echo "The file $file contains the keyword 'Victory'. This file has now been moved to the 'Victory_Archive' directory."
    else
        echo "The file $file does not contain the keyword."
    fi
done
```

### Explanation: 

- The script creates a directory called `Arena_Boss` to store the files.  
- It generates five text files (`file1.txt` to `file5.txt`) inside `Arena_Boss`.  
- A random number of lines (between 10 and 20) is added to each file using the `RANDOM` variable.  
  - `$((RANDOM % 11 + 10))` ensures that the random number is always between 10 and 20.  
  - A `for` loop appends that many lines to each file.  
- The script then sorts the files by size using `ls -l | sort -k 5 -h | awk '{print $9, $5}'`.  
  - `ls -l` lists the files with details.  
  - `sort -k 5 -h` sorts them based on the file size column.  
  - `awk '{print $9, $5}'` extracts and displays the filename and size.  
- The script creates a new directory called `Victory_Archive` to store files that contain `"Victory"`.  
- A `for` loop checks each `.txt` file in `Arena_Boss` using `grep -q "Victory"`.  
  - If the keyword is found, the file is moved to `Victory_Archive`.  
  - If not, the script prints a message stating that the keyword was not found.  

## Level 11: Automated Disk Space Report

### Mission:  
Create a script that checks the disk space usage of a specified directory and sends an alert if the usage exceeds a given threshold.

### Solution:  
```bash
#!/bin/bash

size=10

echo "What is the name of the directory?"
read directory_name

dir_size=$(du -sm "$directory_name" | cut -f1)

if [ "$dir_size" -ge "$size" ]; then
    echo "The $directory_name directory is taking up too much disk space. Please remove any unnecessary files within it or delete the directory."
else
    echo "There is plenty of disk space remaining."
fi
```

### Explanation:  
- The script sets a disk space threshold of `10 MB`.  
- It prompts the user to enter the name of the directory to check.  
- The `du -sm "$directory_name"` command calculates the directory size in megabytes.  
  - `cut -f1` extracts just the numerical size value.  
- An `if` condition checks whether the directory size is greater than or equal to `10 MB`.  
  - If true, the script prints an alert message, warning the user that the directory is using too much space.  
  - Otherwise, it informs the user that there is sufficient disk space remaining.  

## Level 12: Simple Configuration File Parser

### Mission:
Write a script that reads a configuration file in the format KEY=VALUE and prints each key-value pair.

### Solution:
```bash
#!/bin/bash

echo "What is the name of the config file?"
read conf_file

if [ ! -f "$conf_file" ]; then
    echo "The file '$conf_file' doesn't exist."
    exit 1
fi

while IFS='=' read -r KEY VALUE; do
    echo "Key: $KEY, Value: $VALUE"
done < "$conf_file"
```

### Explanation:  

- The script prompts the user to enter the name of a configuration file.  
- It checks if the provided file exists using `[ ! -f "$conf_file" ]`.  
  - If the file does not exist, an error message is displayed, and the script exits.  
- The `while` loop reads the file line by line, using `IFS='=' read -r KEY VALUE` to split each line at the `=` sign.  
  - `KEY` stores the part before `=`, and `VALUE` stores the part after.  
- Each key-value pair is printed in the format: `Key: [KEY], Value: [VALUE]`.  

## Level 13: Backup Script with Rotation

### Mission:
Create a script that backs up a directory to a specified location and keeps only the last 5 backups.

### Solution:
```bash
#!/bin/bash

dir=Level13

mkdir -p Backups

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
tar -czf "Backups/$BACKUP_NAME" "$dir"
echo "Backup file created: $BACKUP_NAME"

cd Backups

backup_count=$(ls -1 | wc -l)

if [ "$backup_count" -gt 5 ]; then
    ls -t | tail -n +6 | while IFS= read -r file; do
        rm -f "$file"
        echo "Deleted old backup: $file"
    done
else
    echo "There are fewer than 5 backups, no files will be deleted."
fi
```

### Explanation:

- The script first defines the directory `Level13` to be backed up.
- It creates a backup directory (`Backups`) if it doesn't already exist using `mkdir -p`.
- The `TIMESTAMP` variable is set to the current date and time in the format `YYYY-MM-DD_HH-MM-SS`, which is used to create a unique backup filename.
- `tar -czf` is used to create a compressed `.tar.gz` backup file of the `Level13` directory and stores it in the `Backups` directory.
- The script then checks how many backup files are in the `Backups` directory using `ls -1 | wc -l`.
- If there are more than 5 backups, it sorts the files by modification time using `ls -t`, then removes all backups older than the 5 most recent ones using `tail -n +6`.
- If there are fewer than 5 backups, it displays a message indicating no backups will be deleted.

## Level 14: User-Friendly Menu Script

### Mission:  
Create an interactive script that presents a menu with options for different system tasks (e.g., check disk space, show system uptime, list users), and executes the chosen task.

### Solution:  
```bash
#!/bin/bash

echo "Choose an option:"
echo "1. Check disk space"
echo "2. List running processes"
echo "3. Check current shell"

read -p "Enter your choice [1-3]: " choice

case $choice in
    1) df -h ;;
    2) ps aux ;;
    3) echo $SHELL ;;
    *) echo "Invalid option" ;;
esac
```

### Explanation:

- The script begins by displaying a menu with three options:
  - Option 1: Check disk space
  - Option 2: List running processes
  - Option 3: Check current shell
  
- The `read -p` command prompts the user to enter a choice, storing their input in the `choice` variable.

- The `case` statement evaluates the user's input and runs the corresponding command:
  - `df -h`: Displays disk space usage in a human-readable format if the user chooses option 1.
  - `ps aux`: Lists all running processes if the user chooses option 2.
  - `echo $SHELL`: Displays the current shell used by the user if option 3 is selected.

- If the user enters an invalid option, the script will output "Invalid option".

## Level 15: Boss Battle 3 - Advanced Scripting

### Mission:  
Combine the skills you've gained! Write a script that:

1. Presents a menu to the user with the following options:
   - Check disk space
   - Show system uptime
   - Backup the Arena directory and keep the last 3 backups
   - Parse a configuration file `settings.conf` and display the values
2. Execute the chosen task.

### Solution:  
```bash
#!/bin/bash

conf="settings.conf"

echo "Choose an option:"
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. Backup the Arena directory and keep the last 3 backups"
echo "4. Parse a configuration file settings.conf and display the values"

read -p "Enter your choice [1-4]: " choice

case $choice in
    1)  df -h ;;
    2)  uptime ;;
    3)  dir="Arena"
        mkdir -p Backups

        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
        BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
        tar -czf "Backups/$BACKUP_NAME" "$dir"
        echo "Backup file created: $BACKUP_NAME"

        cd Backups

        backup_count=$(ls -1 | wc -l)

        if [ "$backup_count" -gt 3 ]; then
            ls -t | tail -n +4 | while IFS= read -r file; do
            rm -f "$file"
            echo "Deleted old backup: $file"
            done
        else
            echo "There are fewer than 3 backups, no files will be deleted."
        fi ;;
    4)  if [ ! -f "$conf" ]; then
            echo "Configuration file does not exist."
            exit 1
        fi
        while IFS='=' read -r KEY VALUE; do
            echo "Key: $KEY, Value: $VALUE"
        done < "$conf" ;;
    *)  echo "Invalid option" ;;
esac
```

### Explanation:

- The script starts by defining the configuration file (`settings.conf`) and displaying a menu with four options for the user to choose from:
  - Option 1: Check disk space
  - Option 2: Show system uptime
  - Option 3: Backup the Arena directory and keep the last 3 backups
  - Option 4: Parse a configuration file (`settings.conf`) and display the key-value pairs

- The `read -p` command prompts the user to enter their choice, which is stored in the `choice` variable.

- The `case` statement processes the user’s input and executes the corresponding task:
  - **Option 1**: Runs `df -h` to display disk space in a human-readable format.
  - **Option 2**: Runs `uptime` to show the system's uptime.
  - **Option 3**: 
    - Creates a backup of the `Arena` directory with a timestamp in the `Backups` directory.
    - If there are more than 3 backups, it deletes the oldest ones to keep only the last 3 backups.
    - If there are fewer than 3 backups, no files are deleted.
  - **Option 4**: 
    - Checks if the `settings.conf` file exists. If not, it exits the script with an error message.
    - If the file exists, it parses the key-value pairs and displays them.

- If the user selects an invalid option, the script outputs "Invalid option".

