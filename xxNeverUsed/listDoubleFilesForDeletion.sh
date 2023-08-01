list="$(fdupes -r .)"
for i in $(seq 1 $(echo "$list" | wc -l)); do
	escapeChars.sh "$(echo "$list" | head -n $i | tail -n1)";
done
