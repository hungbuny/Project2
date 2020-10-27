#!/bin/bash

# this bash script is used to backup a user's home directory to /project 2/.

#Hunter Sacky comment:
#The backup function goes through the User's F: drive and backs up the contents of the
#F:\School\UTSA\Java2\$1 directory where $1 is the argument passed from the terminal which
#should be the username of the user that you wish to backup.
function backup {

	#Hunter Sacky comment:
	#The if statement first checks to see if the user passed it an argument. It evaluates to true if $1 is null.
	#The interesting part of this code is that if you don't pass it an argument, it will set the user to the current
	#user executing the code. If you do pass it an argument, it will then execute the else block which checks to see
	#if the directory for the given user exists. If it doesn't exist, then it will output an error message.
	if [ -z $1 ]; then
		user=$(whoami)

	else
		#This will execute only if the directory doesn't exist. The ! inverses the -d argument which checks to see if
		#a directory exists.
		if [ ! -d "F:/School/UTSA/Java2/$1" ]; then
			echo "Requested $1 user home directory doesn't exist."
			exit 1
		fi
		user=$1
	fi

input=/f/School/UTSA/Java2/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

# The function total_files reports a total number of files for a given directory.
function total_files {
	find $1 -type f | wc -l
}

# The function total_directories reports a total number of directories for a given directory.
function total_directories {
	find $1 -type d | wc -l
}

#The function total_archived_directories reports at total number of archived directores.
function total_archived_directories {
	tar -tzf $1 | grep /$ | wc -l

}

#The function total_archived_files reports a total number of archived files.
function total_archived_files {
	tar -tzf $1 | grep -v /$ | wc -l

}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output)
arch_directories=$( total_archived_directories $output )

echo "######## $user ########"
echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

#Hunter Sacky comment:
#This if statement checks to see if the integer $src_files equals the integer $arch_files
#This is done to ensure that the backup completed successfully. If the number of source files
#matches the number of archived files, then the program executed successfully.
#One interesting feature of the code is how you can print out variables inside of a string
#without having to end quote add the variable and start a new quote like in Java. It is seamless
#how you can add a variable to a bash file.
if [ $src_files -eq $arch_files ]; then
	echo "Backup of $input completed!"
	echo "Details about backup file:"
	ls -l $output
else
	echo "Backup of $input failed!"
fi
}

#Hunter Sacky comment:
#This for loop goes through all of the directories and calls the backup function which will backup the directory
#in a tarball format. One interesting thing about this code is how the for loop starts and ends. It doesn't use {}
#as in Java, the starting { in bash is just the word do and the ending } in bash is the word done;
for directory in $*; do
	backup $directory
done;
