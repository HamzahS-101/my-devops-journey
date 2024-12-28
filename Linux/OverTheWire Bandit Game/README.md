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

```ssh bandit0@bandit.labs.overthewire.org -p 2220```

You will then be prompted to enter the password which has been provided. 

You have now successfully signed into **bandit0** and can progress to the next level.

### Key Commands
- **ssh**

## Level 0-1
### Level Goal
The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.