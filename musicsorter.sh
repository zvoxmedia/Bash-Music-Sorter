#!/bin/bash

#This script consider file names as below
# Audio File1
# Audio File2
# Track File1
# As sper the requirment check the beginning of the word.

#path of a Directory
path=/Music

#check duplicate word of the beginning of the filename
dup=$(ls -1 $path | awk '{print $1}' | uniq -d)

#check .jpg files exist or not. if that is exist those are remove
if [  -f $path/*.jpg ] 
then	

	ls $path/*.jpg | xargs -d '\n' rm -f
fi

#check .jpg files exist or not. if that is exist those are remove
if [   -f $path/*.gif ]
then

	ls $path/*.gif | xargs -d '\n' rm -f
fi

#get the duplicate word and keep highest size file and delete others
for str in ${dup[*]}
do

	ls -1 | grep "^$str"  | xargs -d '\n' du -sh | sort -n -r | tail -n +2 | awk '{$1=""}1' | sed "s/^ *//"  | xargs -d '\n' rm -f
	 

done

