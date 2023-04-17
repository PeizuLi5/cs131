#!/bin/bash

#files that needs to be use
dataset=~/winequality-red.csv
firstFile=./train/data.csv
secondFile=./test/data.csv

#get the total line number from dataset and store split it 80% and 20% (header excluded)
total=$(($(wc -l < $dataset) - 1))
first=$(($total * 80 / 100))
second=$(($total - $first))

#store the first 80% into first file (also add header) (wc -l = 1280)
head -1 $dataset > $firstFile
head -$(($first+1)) $dataset | tail -$first >> $firstFile

#store the second 20% into the second file (also add header) (wc -l = 321)
head -1 $dataset > $secondFile
tail -$second $dataset >> $secondFile

#change the file separator ; to , for both files
sed -i "s/;/,/g" $firstFile
sed -i "s/;/,/g" $secondFile
