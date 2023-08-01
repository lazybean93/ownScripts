#!/bin/bash

#This script cannot handle files in different folders than the execution path

filename=$(basename -- "$1")
filenameWithoutExtension="${filename%%.*}"
filenameExtension="${filename##*.}"
echo $filenameWithoutExtension
echo $filenameExtension
filenameRepaired="$filenameWithoutExtension"_rep."$filenameExtension"
echo $filenameRepaired

DIFF="$(/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 videoFrameNumDiff.sh "$filename" "$filenameRepaired")"
echo $DIFF

if [ -n "$DIFF" ]; then
	mkdir "$DIFF"
	/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 cp "$filename" "$DIFF"
	/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 cp "$filenameRepaired" "$DIFF"
fi;
