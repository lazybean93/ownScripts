INPUT="$1"
if [ -z "$INPUT" ]; then
	INPUT="$(pwd)"
fi
FOLDER="$(echo "$INPUT" | sed 's/\/$//g')"
ARCHIVENAME="$(echo "$INPUT" | sed 's/\///g')"
tsp /usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 tar -czvf "$ARCHIVENAME""_""$(date +"%Y%m%d_%H%M%S")"".tar.gz" "$FOLDER"
