LISTE="$(cat "$1" | grep '.\{41\}' | grep -v '^Schlüssel\|^zu 3 (TSN)')"

for i in $(seq 1 $(echo "$LISTE" | wc -l)); do
	AUTO=$(echo "$LISTE" | head -n $i | tail -n 1)
	
	AUTOSplit=$(echo "$AUTO" | sed 's/ß/0/g;s/ [e,E][0-9]*\*[0-9]*\/[0-9]*/\n/g;s/ [e,E][0-9]*\*KS[0-9]*\/[0-9]*/\n/g;s/ [A-Z][0-9][0-9][0-9] [0-9]\/[0-9]*/\n/g;s/ [A-Z][0-9][0-9][0-9]\/[0-9] [0-9]\/[0-9]*/\n/g;s/ [A-Z][0-9][0-9][0-9] 1[0-9]\/[0-9]*/\n/g;s/ [A-Z][0-9][0-9][0-9]\/[0-9] 1[0-9]\/[0-9]*/\n/g;s/ [A-Z] [0-9][0-9][0-9] [0-9]\/[0-9]*/\n/g;s/ [A-Z] [0-9][0-9][0-9] 1[0-9]\/[0-9]*/\n/g;s/ [A-Z] [0-9][0-9][0-9]\/[0-9] [0-9]\/[0-9]*/\n/g;s/ [0-9][0-9][0-9][0-9]\/[0-9] [0-9]\/[0-9]*/\n/g;s/ [0-9][0-9][0-9][0-9]\/[0-9] 1[0-9]\/[0-9]*/\n/g' | head -n1 | grep '[0-9]* [0-9]* [0-9]*$')
	
	if [ -n "$AUTOSplit" ]; then
		Power=$(echo "$AUTOSplit" | sed 's/ /\n/g' | head -n -4 | tail -n1).0
		MinWeight=$(($(echo "$AUTOSplit" | sed 's/ /\n/g' | head -n -2 | tail -n1)+75)).0
		LG=$(echo "scale=3; $MinWeight/$Power" | bc)
		echo $LG'\t'$MinWeight'/'$Power'\t'$AUTO
	fi
done | sort -h > "$1""_eval.csv"
