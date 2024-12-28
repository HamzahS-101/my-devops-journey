# OverTheWire Bandit Game Solutions (Levels 1-20)

## Introduction
The **OverTheWire Bandit game** is a fun and challenging way to learn fundamental Linux commands and concepts through hands-on problem-solving. It consists of a series of levels, where each level requires you to solve a challenge using different Linux tools and techniques. It's a great resource for beginners to get comfortable with the Linux environment in a safe and engaging way.

I decided to go through this game to solidify my understanding of fundamental Linux commands, improve my troubleshooting skills, and learn how to approach problems systematically. It's been an excellent practical resource on my journey to mastering Linux!

For more details and to start the game, click [here](https://overthewire.org/wargames/bandit/)

## Level 0
### Level Goal
The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. The username is bandit0 and the password is bandit0.
### Solution
To connect to the remote server, we need to use **SSH** with the **username** `bandit0`, the **hostname** `bandit.labs.overthewire.org`, and the **port** `2220`, specifying the port using the `-p` **option**. The command will look like this:

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

You will then be prompted to enter the password which has been provided. 

You have now successfully signed into **bandit0** and can progress to the next level.

### Key Commands
- **ssh**

## Level 0-1
### Level Goal
The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.
### Solution
Repeat the command provided in the [previous level](#level-0) if you aren't connected already.

Once connected, we should automatically be placed in the home directory. We can confirm this by using the `pwd` command which will print out the current working directory. 

```bash
pwd
```
Once this is confirmed, we will use the `ls` command to list out all the files that are stored in the directory we are in.

```bash
ls
```
Which will output the following:

```bash
readme
```

Now that we have confirmed the location of the `readme` file and we are in the correct directory, we can use the `cat` command to display the contents of the `readme` file. This is how the command should look:

```bash
cat readme
```

Which should output the password to the next level. 

To terminate the ssh connection, simply type in the `exit` command like so:

```bash
exit
```

This will return you to the local shell.

### Key Commands
- **pwd**
- **ls**
- **cat**
- **exit**


## Level 1-2
### Level Goal
The password for the next level is stored in a file called - located in the home directory.
### Solution
Connect to the next level through `ssh` by using the same command used previously. However this time we will change the username to `bandit1`. The command should look like this:

```bash
ssh bandit1@bandit.labs.overthewire.org -p 2220
```
You'll be prompted to enter the password. This was the password we obtained on the [previous level](#level-0-1).

Once connected, we'll once again use the `ls` command to confirm that the file we need is in the home directory.

```bash
ls
```
Which will output the necessary filename. 


A file named `-` cannot be accessed using `cat` by itself because the `-` is interpreted as a special argument, typically representing **standard input (stdin)**, rather than as the name of a file. To access the file, you can use `./-`, which explicitly specifies the file in the **current directory**, bypassing the special meaning of `-`. This is how the command should appear:

```bash
cat ./-
```

This will output the password to access the next level.

The `.` represents the current directory in a filesystem path and is used to explicitly refer to files or commands within that directory. We can use `ls -a` to view the `.` directory because the `-a` **option** lists all entries in the directory, including **hidden files** and **special directories** like `.` (representing the current directory) and `..` (representing the parent directory). This allows us to explicitly see the `.` directory listed as part of the output.

You can now use the `exit` command to return to the local shell and begin the next level.

### Key Commands
- **cat**
- **ls -a**

## Level 2-3
### Level Goal
The password for the next level is stored in a file called spaces in this filename located in the home directory.
### Solution
Connect to the next level through `ssh` by using the same command used previously. However this time we will change the username to `bandit2`. The command should look like this:

```bash
ssh bandit2@bandit.labs.overthewire.org -p 2220
```
You'll be prompted to enter the password. This was the password we obtained on the [previous level](#level-1-2).

Once connected, use the `ls` command to confirm that the correct file is stored in our current directory.

Once confirmed, we'll use the `cat` command to print out the contents of the file. Since the filename contains spaces, the cat command won't work unless we enclose the name in quotation marks, as it will interpret each word as a separate filename. The command should look like this:

```bash
cat "spaces in this filename"
```

The password for the next level should now be displayed in the terminal.

You can now use the `exit` command to return to the local shell and begin the next level.

### Key Commands
- **ls**
- **cat**








