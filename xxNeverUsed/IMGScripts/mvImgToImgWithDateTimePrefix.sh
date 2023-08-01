EXIFTOOL_OUT="$(identify -verbose "$1")"
echo $EXIFTOOL_OUT
#FILENAME="$(echo "$EXIFTOOL_OUT" | grep 'File Name' | awk '{split($0,a,": "); print a[2]}')"
#DIRECTORY="$(echo "$EXIFTOOL_OUT" | grep 'Directory' | awk '{split($0,a,": "); print a[2]}')"
#DATETIME="$(echo "$EXIFTOOL_OUT" | grep 'Date/Time Original' | awk '{split($0,a,": "); print a[2]}' | head -n1)"
#if [ ! -z "$DATETIME" ]; then
#	DATETIME_TMP="$(echo "$DATETIME" | awk '{split($0,a," "); print a[1]"_"a[2]}')"
#	DATETIME="$(echo "$DATETIME_TMP" | awk '{split($0,a,":"); print a[1]"_"a[2]"_"a[3]"_"a[4]"_"a[5]}')"
#	mv "$(echo "$DIRECTORY"/"$FILENAME")" "$(echo "$DIRECTORY"/"$DATETIME"_-_"$FILENAME")"
#	#echo "$(echo "$DIRECTORY"/"$FILENAME")" "$(echo "$DIRECTORY"/"$DATETIME"_-_"$FILENAME")"
#fi;

