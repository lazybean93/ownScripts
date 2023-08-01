if [ ! -d temp ]; then
	mkdir temp
fi

SUFFIX=$(echo "$1" | sed 's/\./\n/g' | tail -n1 | tr '[:upper:]' '[:lower:]')
if [ -z "$SUFFIX" ]; then
	echo Please give a suffix
	exit
fi

DATE=$(imageGetCreateDate.sh "$1")
if [ ! -z "$DATE" ]; then
	echo $DATE
	PREFIX=""
	if [ "$SUFFIX" == "mp4" ]; then
		PREFIX="VID_"
	fi
	if [ "$SUFFIX" == "jpg" ]; then
		PREFIX="IMG_"
	fi
	
	DATE="$PREFIX""$DATE"
	TARGET="temp/""$DATE"".""$SUFFIX"
	COUNTER=1
	while [ -f "$TARGET" ]; do
		TARGET="temp/""$DATE""_""$COUNTER"".""$SUFFIX"
		COUNTER=$(($COUNTER+1))
	done
	cp "$1" "$TARGET"
fi
if [ -z "$DATE" ]; then
	cp "$1" "temp/""$1""_""$(getRandomizedNumber.sh)"".""$SUFFIX"
fi
