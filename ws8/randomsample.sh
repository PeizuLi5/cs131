#!/bin/bash

#check if there are two parameters (only 2)
#echo $? = 2 if failed
if [ $# -ne 2  ] ;
then
  >&2 echo "Missing Parameter, 2 required!"
  exit 2
fi

#check if x is in the range [1-99]
#echo $? = 1 if failed
if [[ $1 -lt 1 || $1 -gt 99  ]] ;
then
  >&2 echo 'Number out of range [1-99]'
  exit 1
fi

#check if filename exists
#echo $? = 1 if failed
if [ ! -e $2 ] ;
then
  >&2 echo "$2 does not exists!"
  exit 1
fi

#gets the total number of lines from the file
total=`wc -l < $2`
#get the required random number of lines get printed
required=$((total * $1 / 100))

#randomly print the required number of lines (no repeated)
shuf -n $required $2
