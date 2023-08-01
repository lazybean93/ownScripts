#!/bin/bash

for i in $(ls | grep -v '_rep.avi$' | grep '\.avi$'); do
#	videoDurationDiff.sh $i ${i:0:-4}_rep.avi
	DIFF="$(/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 videoDurationDiff.sh $i ${i:0:-4}_rep.avi)"
	echo $DIFF

	if [ -n "$DIFF" ]; then
		mkdir "$DIFF"
		/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 cp "$i" "$DIFF"
		/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 cp "${i:0:-4}_rep.avi" "$DIFF"
	fi;
	sleep .001
done
