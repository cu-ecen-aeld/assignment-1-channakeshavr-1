#!/bin/sh


#Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr

#Exits with value 1 error and print statements if any of the arguments above were not specified

#Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.


if [ $# -ne 2 ] 
then
    echo Please provide  both the inputs
    exit 1
fi


writefile=$1
writestr=$2

#create directory
dir_name=$(dirname $writefile)

if [ ! -d $dir_name ]
then
    mkdir -p $dir_name
fi

#write/overwrite to directory
echo $writestr>$writefile



#Firl  creation verification
if [ $? -ne 0 ]; then
	echo Error: Unable to create $writefile
	exit 1
fi
