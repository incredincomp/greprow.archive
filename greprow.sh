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
#      REVISION:  11/8/2018 08:45:00 PM
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo " If you would like to define your own path, please press y. Otherwise, if you want this program to break, please press n. "
echo -n "y or n: "
read answer
#not working add if above this though maybe
case $answer in

            [yY] )
                   echo -n "Please type your full file path, starting with a backslash if its absolute. Its more than likely equal to $PWD: "
                   read inputPath
                   ;;

            [nN] )
                   echo "okay, were going to just use $HOME for you."
                   inputPath = $HOME
                   ;;

            *) echo "Invalid input"
                ;;
esac

#if [ $answer = "y" ] ; then
#    echo -n "Please type your full file path, starting with a backslash if req. example, /home/$USER/names.txt : "
#    read inputPath

#else 

#    inputPath = $PWD
#    echo "That's fine, this means this program is going to look in the $PWD location."
#i dont think this is a real working path though, to be checked****#    
#fi  


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
