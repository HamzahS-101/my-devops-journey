# Bash Battle Arena 🎮

## Overview

The "Bash Battle Arena" is a fun and interactive command-line game designed to teach and improve Bash scripting skills. Each level in the game presents a unique challenge that requires players to write Bash scripts to solve problems ranging from simple file manipulations to more complex system operations. As players progress through the levels, they gradually learn new Bash concepts and best practices.

The game follows a level-based structure where the difficulty increases with each level. Every 5 levels, players face a Boss Battle that combines the knowledge they have gained up to that point, reinforcing their understanding of Bash scripting.

**Objective:**  
The goal is to "defeat" each level by successfully completing the tasks using Bash scripts. The ultimate aim is to become a "Bash Master."

As part of my Bash learning, I have documented the solutions for all 15 levels in this file, detailing the steps I followed and sharing insights into the challenges I faced and how I overcame them.

## Level 1: The Basics

### Mission:  
Create a directory named Arena and then inside it, create three files: warrior.txt, mage.txt, and archer.txt. List the contents of the Arena directory.

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

