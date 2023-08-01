if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

for i in $(ls | grep -i '\.avi$\|\.jpg$'); do
	SOFTWARE=$(exiftool $i | grep -i 'Software' | sed 's/ : /\n/g' | grep -v 'Software');
	if [ -z "$SOFTWARE" ]; then
		SOFTWARE="Unknown"
	fi
	mkdir "$SOFTWARE";
	mv $i "$SOFTWARE";
done
