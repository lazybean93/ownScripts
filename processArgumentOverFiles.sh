list="$1"
for i in $(seq 1 $(echo "$list" | wc -l)); do
	"$2" "$(echo "$list" | head -n $i | tail -n1)";
done
