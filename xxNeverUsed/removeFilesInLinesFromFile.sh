inquire ()  {
  echo  -n "$1 [y/n]? "
  read answer
  finish="-1"
  while [ "$finish" = '-1' ]
  do
    finish="1"
    if [ "$answer" = '' ];
    then
      answer=""
    else
      case $answer in
        y | Y | yes | YES ) answer=true;;
        n | N | no | NO ) answer=false;;
        *) finish="-1";
           echo -n 'Invalid response -- please reenter:';
           read answer;;
       esac
    fi
  done
}

if [ $# -lt 1 ]; then
	echo Argument 1, the filepath is missing!
	return
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
	echo File \""$FILE"\" does not Exist!
	return
fi

QUESTION="Are you sure you want to delete these files?"
echo $QUESTION

LINES="$(cat "$FILE" | wc -l)"
COUNT=$LINES
if [ $LINES -gt 10 ]; then
	COUNT=10
fi

if [ $LINES -gt $COUNT ]; then echo "..."; fi
for i in $(seq 1 $COUNT); do
	echo "$(cat "$FILE" | head -n $i | tail -n1)"
done
if [ $LINES -gt $COUNT ]; then echo "...more lines appending"; fi
inquire "$QUESTION"
if $answer; then
	for i in $(seq 1 2); do
		inquire "I'm asking you another Time: $QUESTION"
		if ! $answer; then
			return
		fi
	done

	for i in $(seq 1 $(cat "$FILE" | wc -l)); do
		rm "$(cat "$FILE" | head -n $i | tail -n1)"
	done
else
	return
fi
