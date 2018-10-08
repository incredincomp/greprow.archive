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
#		much appologies
# 
#       OPTIONS: ---
#  REQUIREMENTS: you need to have the names.txt file in a location you know, and put that
#		path in as the input in comment #1
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Robert Hogue
#  ORGANIZATION: MPC
#       CREATED: 09/20/2018 06:32:54 PM
#      REVISION:  10/7/2018 06:04:00
#===============================================================================

set -o nounset                              # Treat unset variables as an error
input="/home/$USER/names.txt"
#1.)input="/current/path/tofile.txt"
#remove this comment and adjust your input path accordingly
echo "Who's line would you like to find?"
read name
echo "looking for $name... please wait" | echo "Start Time :" $(date -u)
while : 
 do
      grep -i $name /home/$USER/names.txt >> $name.txt 
#2.)searches in file (indicated in this script,) for $name user read variable and makes 
#a seperate file $name.txt in same directory as input file. It copys the
#whole matching line to new file or appends to the file that already exists. 
      if [ $? -eq 0 ] ; then
        echo "Name found and writing to file, check current directory for $name.txt"
	exit
      else
        echo "error, name not found"
	exit
      fi
    done
echo "ended at" $(date -u)
