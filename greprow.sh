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
#         NOTES: v1.5
#        AUTHOR: IncredIncomp
#  ORGANIZATION: 
#       CREATED: 09/20/2018 06:32:54 PM
#      REVISION:  11/6/2018 05:45:00
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo " If you would like to define your own path, please press y. Otherwise, if you want this program to break, please press n. "
echo -n "y or n: "
read answer
if [ $answer = "y" ] ; then
    echo -n "Please type your full file path, starting with a backslash if req. example, /home/$USER/names.txt : "
    read inputPath

else 
    echo "That's fine, this means this program is going to look in the /*/*/names.txt location."
#i dont think this is a real working path though, to be checked****#    
    inputPath = "/*/*/names.txt"
fi  

###this is to be sure that your use of this program is even worth while in its current form
#
#this honestly needs to go but I am too attached to everthing.  Im realizing this is not needed though
echo "How is your file organized? (Currently supported option/s are - rows)"
echo -n "type 'rows' if you dont want an error: "
read order
if [ $order = "rows" ] ; then
    echo "Excellent! Then I am currently programmed properly to help you! Lets continue collecting information for your search."
    
else
        echo "Sorry! I am not currently configured to help you.  Send my maker an email at incredincomp@gmail.com and tell him 
         to add what you need!"
    exit
fi    

###

echo -n "Who's line would you like to find? "
read name
echo "Looking for $name... please wait" | echo "Search Start Time : " $(date -u)
#I dont know why this works, how or if it even should.  This while statement shows my naivety to bash scripting though.

###DO NOT TOUCH!!!! THIS SHOULDNT WORK, SO THEREFORE ITS PERFECTLY BROKEN AS IS!!!!###
while : 
 do
      grep -i $name $inputPath >> $name.txt 
###2.)searches in file (indicated in this script,) for $name user read variable and makes 
###a seperate file $name.txt in same directory as input file. It copys the
###whole matching line to new file or appends to the file that already exists. 
      if [ $? -eq 0 ] ; then
        echo "Name found and writing to file, check current directory for $name.txt"
	exit
      else
        echo "Error, name not found."
	exit
      fi
    done
echo "Search ended at" $(date -u)
