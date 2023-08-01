if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

THISDATETIME="$(exiftool -CreateDate "$1" | sed 's/ : /\n/g' | tail -n 1 | sed 's/ /\n/g')"
THISDATE="$(echo "$THISDATETIME" | head -n1 | sed 's/:/\//g')"
THISTIME="$(echo "$THISDATETIME" | tail -n1)"
THISDATETIMEFORMATTED="$(echo "$THISDATE" "$THISTIME")"
THISSECONDS=$(($(date -d "$THISDATETIMEFORMATTED" +%s)+$2))
NOW="$(date -d @$THISSECONDS +"%Y:%m:%d %H:%M:%S")"
exiftool -ModifyDate="$NOW" -DateTimeOriginal="$NOW" -CreateDate="$NOW" -SonyDateTime="$NOW" "$1"
