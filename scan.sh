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

echo $PWD | tr -cd '/' | wc -c

i=1;
scanner=$(scanimage -L | cut -d '`' -f2 | cut -d "'" -f1 );
if [ "$scanner" != "" ]; then
	scan=true;
	if [ "$(echo $PWD | tr -cd '/' | wc -c)" -eq "0" ] || [ "$(echo $PWD | tr -cd '/' | wc -c)" -eq "0" ]; then
		while $scan; do
			name=$(printf "%03d" $i);
			scanimage -d "$scanner" --resolution 300 --mode Color --format png > $name.png
			i=$(($i+1));
			inquire "Continue with Page $i?"
			scan=$answer
		done
	fi
	processScannedDocument.sh
fi
