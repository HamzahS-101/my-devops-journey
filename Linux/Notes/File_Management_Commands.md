# File Management Commands

- `touch` - Used to create an empty file if it doesn't exist, or to update the access and modification timestamps of an existing file.

- `mkdir` - Used to create one or more new directories. Use the `-p` option to create subdirectories in a path.

- `echo` - Used to display a line of text to the terminal. You can use `>` to write to a file and `>>` to append a file without overwriting the existing content.

- `cat` - Used to display the contents of a file and concatenate (combine) multiple files.

- `cd` - Used to navigate between directories in a file system. 

- `ls` - Used to list the contents of a directory. By default it shows the names of files and directories in the current directory.

  You can also use options with `ls` to modify its behaviour:
  - `ls -l` shows detailed imformation (permissions, owner, size and timestamp).
  - `ls-a` shows all files, including hidden files (those starting with a dot).
  - `ls -lh` shows file sizes in a human-readable format (e.g. KB,MB).

- `cp` - Used to copy files or directories. Use the `-r` option to copy directories recursively i.e. copy the directory and its contents.

- `mv` - Used to move or rename files and directories.

- `file` - Used to determine the type of a file. It examines the file's content and provides information about its format, regardless of its file extension.

- `grep` - Used to search for a specific pattern or text within files. 

- `rmdir` - Used to remove empty directories.

- `rm` - Used to remove files or non-empty directories. Use the `-r` option to remove directories and their contents recursively.

- `find` - Used to search for files and directories based on various criteria such as name, type, size and modification date.

- `chmod` - Used to change the permissions of a file or directory. Allows you to set the read, write and execute permissions for the owner, group and others.

- `chown` - Used to change the ownership of a file or directiory. It allows you to specify the user and/or group that should own the file.

 - `head/tail` - Used to display the beginning or end of a file.