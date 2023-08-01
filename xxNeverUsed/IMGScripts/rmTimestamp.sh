#TIMESTAMP=$(identify -verbose $1 | grep "exif:DateTimeOriginal:")
#TIMESTAMP=$(exiftool $1 | grep "Date/Time Original" | head -n1)

#DATE_GREP=$(echo $TIMESTAMP | sed 's/ /\n/g' | grep 2021)
#DATE=$(echo $DATE_GREP | sed 's/://g')
#TIME=$(echo $TIMESTAMP | sed 's/ /\n/g' | sed 's/://g' | tail -n1)
#echo "$DATE"_"$TIME"

#BASENAME=$(echo $1 | sed 's/\./\n/g' | head -n1)
#SUFFIX=$(echo $1 | sed 's/\./\n/g' | tail -n1)

#TIMESTAMP=$(echo _"$DATE"_"$TIME")
BASENAME=$(echo $1 | sed 's/_2021/\n/g' | head -n1)
#FILENAME=$(echo $1 | sed s/"$TIMESTAMP"//g)

#echo "$TIMESTAMP"
#echo "$FILENAME"

mv $1 "$BASENAME".jpg
