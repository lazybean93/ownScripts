IFS=$(echo -en "\n\r");
for i in $(find . -type f | grep -v '\.zip'); do
	RANDOMVALUE=$(($RANDOM*$(($(date +%N | sed 's/0//g') % 10000))))
	mv "$i" "$RANDOMVALUE"".jpg";
done;

