#!/bin/bash
#This script cannot handle files in different folders than the execution path

getNUM () {
#	exiftool "$1" | grep 'Video Frame Count' >> $1.txt
	THISNUM="$(exiftool "$1" | grep 'Video Frame Count' | sed 's/ : /\n/g' | tail -n 1)"
	echo $THISNUM
}

FILE1=$(getNUM $1)
FILE2=$(getNUM $2)

DIFF=0;

if [ $FILE1 -gt $FILE2 ]; then
	DIFF=$(($FILE1-$FILE2))
else
	DIFF=$(($FILE2-$FILE1))
fi
echo $DIFF
