#!/bin/bash

count=0;
total=0; 

for i in $( awk '{ print $1; }'  51147790.txt )
   do 
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "scale=2; $total / $count" | bc
