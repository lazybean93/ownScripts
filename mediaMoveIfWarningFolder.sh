if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

CAMERA=$(exiftool $1 | grep 'Warning' | sed 's/ : /\n/g' | grep -v 'Warning');
if [ -z "$CAMERA" ]; then
	CAMERA="Unknown"
fi
mkdir "$CAMERA";
mv $1 "$CAMERA";
