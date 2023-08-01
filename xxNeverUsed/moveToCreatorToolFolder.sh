for i in $(ls); do
	TOOL=$(exiftool $i | grep 'Creator Tool' | sed 's/ : /\n/g' | grep -v 'Creator Tool' | sed 's/ /_/g');
	if [ -z "$TOOL" ]; then
		TOOL="Unknown"
	fi
	echo $TOOL
	mkdir "$TOOL";
	cp $i "$TOOL";
done
