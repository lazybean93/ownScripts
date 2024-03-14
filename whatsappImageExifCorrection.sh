#get Filename
FILENAME=$(basename -- "$1")

#FILENAME = IMG-20200313-WA0022.jpg
#split according to "-"
FILENAME=$(echo "$FILENAME" | sed 's/-/\n/g')

#FILENAME = IMG
#			20200313
#			WA0022.jpg
#DATE in line 2
#Number in line 3 
DATE=$(echo "$FILENAME" | head -n2 | tail -n1)
NUMBER=$(echo "$FILENAME" | tail -n1 | sed 's/WA//g;s/\./\n/g' | head -n1)

#DATE = 20200313
#NUMBER = 0022
DATE=$(date -d "$(echo "$DATE" "$NUMBER")" +"%Y:%m:%d %H:%M:%S")

#DATE = 2020:03:13 00:22:00
exiftool -ModifyDate="$DATE" -DateTimeOriginal="$DATE" -CreateDate="$DATE" "$1"

