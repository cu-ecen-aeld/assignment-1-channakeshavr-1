#!/bin/sh

#Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr
#Exits with return value 1 error and print statements if any of the parameters above were not specified
#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

if [ $# -ne 2 ] 
then
    echo Please provide  both the inputs
    exit 1
fi


filesdir=$1
searchstr=$2

#Check given directory path is valid or not

if ! [ -d $filesdir ]
then
    echo Given directory path not present
    exit 1
fi


X=$(find $filesdir -type f | wc -l)


Y=$(find $filesdir -type f | xargs grep -Hn $searchstr | wc -l)


echo "The number of files are $X and the number of matching lines are $Y"
