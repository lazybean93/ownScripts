if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

for i in $(ls | grep '\.jpg$\|\.JPG$'); do
	CAMERA=$(exiftool $i | grep -i 'Software' | sed 's/ : /\n/g' | grep -v 'Software');
	if [ -z "$CAMERA" ]; then
		CAMERA="Unknown"
	fi
	mkdir "$CAMERA";
	cp $i "$CAMERA";
done
