#!/bin/bash
#This script cannot handle files in different folders than the execution path

getTOTALSECONDS () {
#	exiftool "$1"
	THISDATETIME="$(exiftool "$1" | grep Duration | sed 's/ : /\n/g' | tail -n 1 | sed 's/ /\n/g')"
	SECONDS=$(echo $THISDATETIME | sed 's/:/\n/g' | tail -n1)
	echo $SECONDS >> $1.txt
	MINUTES=$(echo $THISDATETIME | sed 's/:/\n/g' | head -n2 | tail -n1)
	echo $MINUTES >> $1.txt
	HOURS=$(echo $THISDATETIME | sed 's/:/\n/g' | head -n1 | tail -n1)
	echo $HOURS >> $1.txt
	TOTALSECONDS=$(($SECONDS+$((60*$(($MINUTES+$((60*$HOURS))))))))
	echo $TOTALSECONDS
}

getTOTALMILLISECONDS () {
	VIDEOFRAMERATE="$(exiftool -VIDEOFRAMERATE "$1" | sed 's/ : /\n/g' | tail -n 1 )"
	VIDEOFRAMECOUNT="$(exiftool -VIDEOFRAMECOUNT "$1" | sed 's/ : /\n/g' | tail -n 1 )"
	VIDEOMILLISECONDSPERFRAME="$(echo 1000/$VIDEOFRAMERATE | bc -l)"
	TOTALMILLISECONDS="$(echo $VIDEOMILLISECONDSPERFRAME*$VIDEOFRAMECOUNT | bc -l)"
	INTTOTALMILLISECONDS="$(LC_NUMERIC=C printf "%.0f" $TOTALMILLISECONDS)"
#	echo $VIDEOFRAMERATE > $1.txt
#	echo $VIDEOFRAMECOUNT >> $1.txt
#	echo $VIDEOMILLISECONDSPERFRAME >> $1.txt
	echo $INTTOTALMILLISECONDS
}

FILE1=$(getTOTALMILLISECONDS $1)
FILE2=$(getTOTALMILLISECONDS $2)

DIFF=0;

if [ $FILE1 -gt $FILE2 ]; then
	DIFF=$(($FILE1-$FILE2))
else
	DIFF=$(($FILE2-$FILE1))
fi
echo $DIFF
