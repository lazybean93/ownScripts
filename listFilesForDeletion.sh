list="$(find . -type f)"
for i in $(seq 1 $(echo "$list" | wc -l)); do
	echo "rm ""$(escapeChars.sh "$(echo "$list" | head -n $i | tail -n1)")";
done
