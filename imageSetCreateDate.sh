if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

#example for $2: "2022:07:01 11:42:55"
exiftool -CreateDate="$2" -DateTimeOriginal="$2" -ModifyDate="$2" -SubSecCreateDate="$2".00 -SubSecDateTimeOriginal="$2".00 -SubSecModifyDate="$2".00 "$1"
