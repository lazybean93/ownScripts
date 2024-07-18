SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
PASSWORDS="$(cat "$SCRIPTPATH"/passwords.txt)"
for i in $PASSWORDS; do
	result=$((qpdf -password="$i" -decrypt "$1" "$(echo $1 | sed 's/\.pdf$//g' | sed 's/\.pdf$//g')"_decrypt.pdf) 2>&1)
	if [ -z "$result" ]; then
		echo "$1" "$i"
	else
		echo "not ""$i"
	fi
done
