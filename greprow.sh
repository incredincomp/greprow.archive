#!/bin/bash - 
#===============================================================================
#
#          FILE: greprow.sh
# 
#         USAGE: ./greprow.sh 
# 
#   DESCRIPTION: Enter the first or full name of one of the people on your list, this will
#		pull the entire line that is related to that name and print/append the data
#		to a new file with the name of the search issued.  needs format work,
#		much apologies
# 
#       OPTIONS: ---
#  REQUIREMENTS: you need to have the names.txt file in a location you know, and put that
#		path in as the input in comment #1
#          BUGS: none as far as I know of in its current state
#         NOTES: v1.1
#        AUTHOR: Robert Hogue
#  ORGANIZATION: 
#       CREATED: 09/20/2018 06:32:54 PM
#      REVISION:  10/13/2018 05:34:00
#===============================================================================

set -o nounset                              # Treat unset variables as an error
###new add, set input path from string, not complete
#echo "Please define your input file path. Example /home/****/file.txt"
#
#read inputPath
#if ( $inputPath 
###this is to be sure that your use of this program is even worth while in its current form
#echo ""
#read order
#if ( $order = *rows*) 
#then
#  echo "Excellent! Then I am currently programmed properly to help you! lets continue collecting information for your search."
#fi 
###start a case statement here to collect/choose data/paths
#
#
#
#
#


input="/home/$USER/names.txt"
###1.)input="/current/path/tofile.txt"
#

echo "Who's line would you like to find?"
read name
echo "looking for $name... please wait" | echo "Start Time :" $(date -u)
while : 
 do
      grep -i $name /home/$USER/names.txt >> $name.txt 
###2.)searches in file (indicated in this script,) for $name user read variable and makes 
###a seperate file $name.txt in same directory as input file. It copys the
###whole matching line to new file or appends to the file that already exists. 
      if [ $? -eq 0 ] ; then
        echo "Name found and writing to file, check current directory for $name.txt"
	exit
      else
        echo "error, name not found"
	exit
      fi
    done
echo "ended at" $(date -u)
