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
#         NOTES: v2.2
#        AUTHOR: @incredincomp & @Venom404
#  ORGANIZATION: 
#       CREATED: 09/20/2018 06:32:54 PM
#      REVISION:  11/15/2018 11:45:00 PM
#===============================================================================

set -o nounset                              # Treat unset variables as an error


echo " If you would like to define your own path, please press y. Otherwise, if you want this program to break, please press n. "
echo -n "y or n: " 
read answer
case $answer in

            [yY] )
                   read -p "Please type your full file path, starting with a backslash if its absolute. Its more than likely equal to $PWD/names.txt: " inputPath
                   ;;

            [nN] )
                   echo "okay, were going to just use $PWD/log.txt for you."
                   inputPath="$PWD/log.txt"
                   ;;

            * ) echo "Invalid input"
                continue
		;;
esac

echo -n "What lines would you like to find? "
read lookFor
echo "Looking for $lookFor... please wait" | echo "Search Start Time : " $(date -u)

#I dont know why this works, how or if it even should.  This while statement shows my naivety to bash scripting though.
###DO NOT TOUCH!!!! THIS SHOULDNT WORK, SO THEREFORE ITS PERFECTLY BROKEN AS IS!!!!###
while : 
 do
      grep -i $lookFor $inputPath >> $lookFor.txt 
###2.)searches in file (indicated in this script,) for any version of the $lookFor variable and makes 
###a seperate file $lookFor.txt in same directory as input file. It copys the
###whole matching line to new file or appends to the file that already exists if set up as CRON job. 
      if [ $? -eq 0 ] ; then
        echo "Name found and writing to file, check current directory for $lookFor.txt"
	exit
      else
        echo "Error, name not found."
	exit
      fi
    done
echo "Search ended at" $(date -u)
