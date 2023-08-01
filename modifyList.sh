#1. List to modify
#2. Prefix
#3. Suffix

list="$(cat $1)"
for i in $(seq 1 $(echo "$list" | wc -l)); do
	echo "$2""$(echo "$list" | head -n $i | tail -n1)""$3";
done
