NOW=$(date +%s)
mkdir $NOW
for i in $(seq 1 $(cat files.txt | wc -l)); do
	FILE="$(cat files.txt | head -n $i | tail -n1 | grep -v files.txt)"
	if [ ! -z "$FILE" ]; then
		TIME=$(stat "$FILE" | grep Mod | sed 's/Modifiziert: //g' | sed 's/.000000000 +0200//g')
		cp "$FILE" $NOW/$(date -d "$TIME" +%Y%m%d_%H%M%S)_$(date +%N).jpg
	fi
done
