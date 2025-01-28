#Define constants
TIMESTAMP=$(date +%s)
LOGALLURLS="log_allurls_$TIMESTAMP"
#YOUTUBEDL="youtube-dl"
YOUTUBEDL="yt-dlp_linux"
TSP="tsp"
IFSOLD=$IFS
IFS=$'\n'

#Update
"$YOUTUBEDL" -U > /dev/zero 2>&1 &

#Download list of Videos
"$YOUTUBEDL" --skip-download "$1" > "$LOGALLURLS" 2>&1

#Get Playlistname & Urls of Titles
PLAYLISTNAME="$(cat "$LOGALLURLS" | grep 'Downloading playlist' | head -n1 | sed 's/: /\n/g' | tail -n1)"
URLTITLES="$(cat "$LOGALLURLS" | grep http | tac | head -n -1 | sed 's/ /\n/g' | grep http | tac)"

#Create Folder and Enter it
mkdir "$PLAYLISTNAME"
cd "$PLAYLISTNAME"

CURRENTTASKNUM=$("$TSP" -S)
"$TSP" -S $(echo "$URLTITLES" | wc -l)
for i in $(seq 1 $(echo "$URLTITLES" | wc -l)); do
	NUMBER=$(printf "%03d" $i);
	TSP_URL=$(echo "$URLTITLES" | head -n $i | tail -n 1)
	TSP_DOWNLOAD=$(echo "$YOUTUBEDL" "$TSP_URL")
	TSP_GREP="$(echo "$URLTITLES" | head -n $i | tail -n 1 | sed 's/=/\n/g' | tail -n 1)"
	TSP_FILE="FILE=\$(ls | grep "$TSP_GREP")"
	TSP_FFMPEG="ffmpeg -i \"\$FILE\" -codec:a libmp3lame -qscale:a 2 \"\$(echo $NUMBER - \"\$FILE\")\".mp3"
	TSP_RMFILE="rm \"\$FILE\""
	"$TSP" sh -c ""$TSP_DOWNLOAD"; "$TSP_FILE"; "$TSP_FFMPEG"; "$TSP_RMFILE"";
done
"$TSP" -w
"$TSP" -S $CURRENTTASKNUM

exit

#IFSOLD=$IFS
#IFS=$'\n'
#for i in $(ls); do
#	echo "$i"
#	URL=$(echo "$i" | sed 's/\[/\n/g' | grep '\.webm' | sed 's/\]\.webm//g')
#	NUMBER=0
#	for j in $(seq 1 $(echo "$URLTITLES" | wc -l)); do
#		if [ -n "$(echo "$URLTITLES" | head -n $j | tail -n 1 | grep $URL)" ]; then
#			NUMBER=$j
#			break;
#		fi
#	done
#	tsp cp "$i" "$(printf "%03d" $NUMBER)"" ""$i"
#done
#IFS=$IFSOLD
#exit


#rm "$LOGALLURLS"

#"$YOUTUBEDL" "$1" > "$LOGALLURLS"
##LOGALLURLS="log_allurls_1662273813"
#FILES="$(cat "$LOGALLURLS" | grep '\[Merger\] Merging formats into' | sed 's/\[Merger\] Merging formats into //g' | sed 's/ \[/\n/g' | grep '\.webm"\|\.mkv"' | sed 's/\]/\n/g' | grep -v '\.webm"\|\.mkv"')"
#for i in $(seq 1 $(echo "$FILES" | wc -l)); do
#	NUMBER=$(printf "%03d" $i);
#	FILE="$(echo "$FILES" | head -n $NUMBER | tail -n 1)";
#	FILE="$(ls *"$FILE"*)"
#	echo $NUMBER $FILE;
#	ffmpeg -i "$FILE" -codec:a libmp3lame -qscale:a 2 "$NUMBER"" ""$FILE"".mp3";
#	rm "$FILE"
#done
