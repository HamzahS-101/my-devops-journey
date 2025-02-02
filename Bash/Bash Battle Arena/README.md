# Bash Battle Arena 🎮

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



