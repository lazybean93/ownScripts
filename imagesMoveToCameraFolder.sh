if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

for i in $(ls | grep '\.jpg$'); do
	CAMERA=$(exiftool $i | grep 'Camera Model Name' | sed 's/ : /\n/g' | grep -v 'Camera Model Name');
	if [ -z "$CAMERA" ]; then
		CAMERA="Unknown"
	fi
	mkdir "$CAMERA";
	cp $i "$CAMERA";
done
