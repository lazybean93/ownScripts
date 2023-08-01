TIMESTAMP=$(date +%s)
#YOUTUBEDL="youtube-dl"
YOUTUBEDL="yt-dlp_linux"

"$YOUTUBEDL" -U

LOGALLURLS="$(echo log_allurls_$TIMESTAMP)"
"$YOUTUBEDL" --skip-download "$1" > "$LOGALLURLS" 2>&1 &

PLAYLISTNAME=""
while [ -z "$PLAYLISTNAME" ]; do
	PLAYLISTNAME="$(cat log_allurls_$TIMESTAMP | grep 'Downloading playlist' | head -n1 | sed 's/: /\n/g' | tail -n1)"
	sleep .1
done;
for i in $(ps -e | grep "$YOUTUBEDL" | grep -v grep | sed 's/ /\n/g' | grep -v '^$' | grep -v '[a-z]\|:' | sort -r); do
	kill -9 $i &> /dev/null
done
echo $PLAYLISTNAME
rm "$LOGALLURLS"

mkdir "$PLAYLISTNAME"
cd "$PLAYLISTNAME"
"$YOUTUBEDL" "$1" > "$LOGALLURLS"
#LOGALLURLS="log_allurls_1662273813"
FILES="$(cat "$LOGALLURLS" | grep '\[Merger\] Merging formats into' | sed 's/\[Merger\] Merging formats into //g' | sed 's/ \[/\n/g' | grep '\.webm"\|\.mkv"' | sed 's/\]/\n/g' | grep -v '\.webm"\|\.mkv"')"
for i in $(seq 1 $(echo "$FILES" | wc -l)); do
	NUMBER=$(printf "%03d" $i);
	FILE="$(echo "$FILES" | head -n $NUMBER | tail -n 1)";
	FILE="$(ls *"$FILE"*)"
	echo $NUMBER $FILE;
	ffmpeg -i "$FILE" -codec:a libmp3lame -qscale:a 2 "$NUMBER"" ""$FILE"".mp3";
	rm "$FILE"
done
