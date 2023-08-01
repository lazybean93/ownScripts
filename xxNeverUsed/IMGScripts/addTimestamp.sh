if [ -z $1 ];
then
	echo "Enter Filename!"
	return;
fi

TIMESTAMP=$(exiftool "$1" | grep "Date/Time Original" | head -n1)
#identify -verbose $1
#echo $TIMESTAMP
DATE_GREP=$(echo $TIMESTAMP | sed 's/ /\n/g' | grep 2021)
DATE=$(echo $DATE_GREP | sed 's/://g')
TIME=$(echo $TIMESTAMP | sed 's/: /\n/g' | tail -n1 | sed 's/ /\n/g' | tail -n1 | sed 's/://g')
#GPSTIME=$(exiftool $1 | grep 'GPS Time' | sed 's/: /\n/g' | tail -n1 | sed 's/://g' | sed 's/^0*//')
#echo $GPSTIME
#TIME=$(($GPSTIME+20000))
#echo "$DATE"_"$TIME"

BASENAME=$(echo $1 | sed 's/\./\n/g' | head -n1)
SUFFIX=$(echo $1 | sed 's/\./\n/g' | tail -n1)

echo IMG_"$DATE"_"$TIME"".""$SUFFIX"
mv $1 $(echo IMG_"$DATE"_"$TIME"".""$SUFFIX")
